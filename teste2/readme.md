<div align="center">


# Teste 2: 
Transformação de dados
</div>

<p>
Neste teste, foi desenvolvido um algoritmo em Python que, tendo como entrada o <strong>Anexo I</strong> do teste anterior, extrai todos os dados da tabela Rol de Procedimentos e Eventos em Saúde e os salva em uma tabela estruturada no formato CSV. Além disso, o algoritmo substitui abreviações nos registros por suas descrições completas, conforme a legenda. Por fim, o arquivo CSV é compactado em um arquivo Teste_LuisHenriqueDaSilva.zip.
</p>


## Requisitos de sistema

- <a href="https://www.python.org/downloads/">Python3</a>
- <a href="https://pypi.org/project/pip/">Python Pip</a>

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

Caso tudo tenha dado certo, deve ter sido criado os arquivos <strong>"tabelas_extraidas.csv"</strong> e <strong>"Teste_LuisHenriqueDaSilva.zip"</strong> dentro da pasta <strong>outputs</strong>

## Sobre a implementação

### Extração dos dados
Tendo como entrada o arquivo <strong>"Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf"</strong>, o módulo pdfplumber é utilizado para extrair os dados das tabelas e convertê-los em uma lista estruturada, tornando-os interpretáveis pelo Python.

### Substituição de abreviações e salvar em .csv

Com os dados armazenados em uma lista no Python, os valores "OD" e "AMB" são substituídos por "Seg. Odontológica" e "Seg. Ambulatorial", respectivamente. Após as substituições, os dados são salvos no arquivo <strong>"outputs/tabelas_extraidas.csv".</strong>

### Compactando arquivos
Da mesma forma que no Teste 1, a biblioteca zipfile é utilizada para compactar o arquivo em um único .zip, sendo salvo no caminho <strong>"/outputs/Teste_LuisHenriqueDaSilva.zip".</strong>