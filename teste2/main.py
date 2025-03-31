import pdfplumber
import pandas as pd
import logging
import zipfile

logging.basicConfig(level=logging.INFO)

def zip_files(path: str, filename:str, output_path:str) -> bool:
    try:
        with zipfile.ZipFile(output_path, 'w') as zipfl:
            zipfl.write(path, arcname=filename)
        logging.info(f"{output_path} created with success")
        
    except Exception as error:
        logging.error(f"Erro while zip file to {output_path}: {error}")
        return False
    
    return True

def convert_table(pdf_path, target_path):
    try:
        tables = []
        with pdfplumber.open(pdf_path) as pdf:
            for index, page  in enumerate(pdf.pages, start=1):
                table = page.extract_table()
                if table:
                    df = pd.DataFrame(table[1:], columns=table[0])
                    tables.append(df)
                    logging.info(f"table extracted from page {index}")
        df_final = pd.concat(tables, ignore_index=True)

        substituicoes = {
            "OD": "Seg. Odontológica",
            "AMB": "Seg. Ambulatorial",
        }
        df_final["OD"] = df_final["OD"].replace(substituicoes)
        df_final["AMB"] = df_final["AMB"].replace(substituicoes)
        df_final.to_csv(target_path, index=False)
        
        logging.info(f"table saved: {target_path}")

    except Exception as error:
        logging.error(f"An unexpected error occurred: {error}")


if __name__ == "__main__":
    pdf_path = "Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf"
    target_path = "outputs/tabelas_extraidas.csv"
    convert_table(pdf_path, target_path)
    zip_files(target_path, "tabelas_extraidas.csv",  "outputs/Teste_LuisHenriqueDaSilva.zip")
    