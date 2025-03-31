import requests
from bs4 import BeautifulSoup
import logging
import zipfile
import time
import os

logging.basicConfig(level=logging.INFO)

def get_page_soup(url) -> BeautifulSoup | None:
    try: 
        response = requests.get(url)
        if response.status_code != 200:
            logging.error(f"The request to the page {url} returned a status code {response.status_code}")
            return None

        return BeautifulSoup(response.text, "html.parser")
    
    except Exception as error:
        logging.error(f"error while fetching the page {url}: {error}")
        return None

def search_attachments(soup: BeautifulSoup, searching: list[str], file_types: list[str] = ["pdf"]) -> list[tuple[str, str]]:
    links = []
    for link in soup.find_all("a", href=True):
        href = link.get("href").lower().strip()
        text = link.text.strip()

        if any(href.casefold().endswith( f".{ext.casefold()}") for ext in file_types):
            if searching is None or any(term.casefold() in text.casefold() for term in searching):
                links.append((text, link["href"]))
    return links

def download_file(filePath, url) -> bool:
    try:
        result = requests.get(url)
        with open(filePath, 'wb') as file:
            file.write(result.content)
        logging.info(f"File {filePath} downloaded with success")
        return True
    except Exception as error:
        logging.error(f"Error while downloading file {filePath} {error}")
        return False

def zip_files(paths: list[tuple[str, str]], output_path:str) -> bool:
    if len(paths) == 0:
        return True
    try:
        with zipfile.ZipFile(output_path, 'w') as zipfl:
            for path, filename in paths:
                zipfl.write(path, arcname=filename)
                logging.info(f"{path} zipped with success")
        logging.info(f"{output_path} created with success")
    except Exception as error:
        logging.error(f"Erro while zip files to {output_path}: {error}")
    
def main():
    url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"

    try:
        valid_soup = get_page_soup(url)
        if not valid_soup:
            return

        searching_texts = ["ANEXO I", "ANEXO II", "ANEXOI", "ANEXOII", "ANEXO I.", "ANEXO II.", "ANEXOI.", "ANEXOII."]
        links = search_attachments(valid_soup, searching=searching_texts)
        if len(links) == 0:
            logging.warning("0 attachments found in page for the searched texts.")
            return

        paths:list[tuple[str, str]] = []
        for _, url in links:
            filename = url.split("/").pop()
            file_path = os.path.join("datas", "downloads", filename)
            downloaded_with_success = download_file(file_path, url)
            if downloaded_with_success:
                paths.append((file_path, filename))
        
        if not paths:
            logging.warning("No files were successfully downloaded.")
            return

        current_timestamp = int(time.time())
        zip_path = os.path.join("datas", "outputs", f"output-{current_timestamp}.zip")
        zip_files(paths, output_path=zip_path)

    except Exception as error:
        logging.error(f"An unexpected error occurred: {error}")
    

if __name__ == "__main__":
    main()