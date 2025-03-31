<div align="center">
    
# Teste 1
Web Scraper Python

</div>

<p>
Neste teste, foi desenvolvido um algoritmo em Python que acessa o site <a href="https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos">"O Rol de Procedimentos e Eventos em Saúde"</a>, baixa os dois anexos e os compacta em um único arquivo .zip
</p>


## Requisitos de sistema

- <a href="https://www.python.org/downloads/">Python3</a>
- <a href="https://pypi.org/project/pip/">Python Pip</a>
- Acesso a internet

## Como executar

Tendo este repositorio em sua máquina e todos os requisitos de sistema instalados, siga os seguintes passos:


( É recomendado utilizar um ambiente virtual para isolar as dependências do projeto):

```bash
    python3 -m venv env # Cria um ambiente virtual
    
    # Ative o ambiente virtual:
    source ./env/bin/activate # No linux
    env/bin/activate # No windows
```

Utilizando o pip, instale as dependencias do projeto:

``` bash
    pip install -r requirements.txt
```

Execute a aplicação: 

```bash 
    python3 main.py
```

Caso tudo tenha dado certo, deve ter sido criado o arquivo compactado dentro da pasta /datas/outputs e os arquivos separados dentro de /datas/downloads

## Sobre a implementação do algoritmo

### Busca de anexos:

Utilizando o módulo requests, é feita uma requisição para a página do governo que contém <a href="https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos">"O Rol de Procedimentos e Eventos em Saúde"</a>. A resposta retorna o HTML da página, que é então processado com BeautifulSoup (BS4) para criar uma "soup". Em seguida, o código percorre os links da página em busca daqueles cujo texto seja <strong>"anexo I"</strong> ou <strong>"anexo II"</strong>, extraindo os respectivos URLs para download dos arquivos PDF.

### Download de arquivos 
Tendo o link de cada anexo, é feita uma nova requisição utilizando o módulo requests para carregar o PDF correspondente. Caso a resposta seja positiva (indicando que tudo ocorreu como planejado), o conteúdo dos arquivos é salvo em formato PDF dentro da pasta <strong>/datas/downloads</strong>.

### Comprimindo arquivos

Tendo todos os arquivos baixados, o módulo zipfile é utilizado para compactá-los em um único arquivo .zip, que é salvo dentro da pasta /datas/outputs.