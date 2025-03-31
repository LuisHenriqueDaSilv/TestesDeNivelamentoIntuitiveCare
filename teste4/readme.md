<div align="center">
    
# Teste 4
 Um sistema FullStack
</div>

<p>
Neste teste, foi desenvolvido um sistema de busca de operadoras de planos de saúde utilizando Python/Flask no backend e Vue.js no frontend web. O sistema permite buscar operadoras pelo CNPJ, número de registro na ANS ou qualquer outro campo relevante, exibindo detalhes como nome, endereço e número de registro. Para a comunicação entre frontend e backend, foi utilizado Axios, garantindo requisições eficientes. Além disso, a interface foi projetada para ser responsiva e intuitiva, proporcionando uma melhor experiência ao usuário.
</p>

<div align="center">
    <img  width="80%" src="https://i.imgur.com/Y5LRn8n.png"/>
</div>
</br>

## Requisitos de sistema

<strong>Backend:</strong>
- <a href="https://www.python.org/downloads/">Python</a>
- <a href="https://pypi.org/project/pip/">Python-Pip</a>

<strong>Frontend:</strong>
- <a href="https://nodejs.org/en">NodeJs</a>
- <a href="https://www.npmjs.com/">NPM</a>

## Como executar o Backend Python

<strong>Backed:</strong>

Com o repositório em sua máquina e todos os requisitos de sistema instalados, no diretorio <strong>/backend</strong> execute os seguintes passos:

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
python3 run.py
```

Caso tudo tenha dado certo, deve ser possivel acessar a API no endereço <strong>http://localohost:3000</strong> (Porta configuravel no arquivo run.py)
</br>

## Testar o backend independentemente
Caso queira testar o backend de forma independente do frontend, você pode utilizar o <a href="https://www.postman.com/">Postman</a> ou qualquer outro cliente HTTP para realizar as requisições.
(Em caso de testes com o postman, é possivel usar a collection <strong>"Teste4DeNivelamentoIntuitiveCare.postman_collection.json"</strong>)

<strong>Endpoints:</strong>


Rota <strong>/search</strong>

- <strong>Método: GET</strong>

- <strong>Descrição:</strong> Permite realizar pesquisas enviando o termo desejado e a página dos resultados como parâmetros na URL.
</br>
</br>


| Parâmetro | Tipo   | Obrigatório | Descrição |
|-----------|--------|-------------|-----------|
| `query`   | String | ❌ Não       | Termo a ser pesquisado |
| `page`    | Int    | ❌ Não       | Número da página dos resultados (padrão: 0) |


exemplo: 
```bash 
get /search?query=SAUDE&page=2
```

## Executar FrontEnd

Com o repositório em sua máquina, backend sendo executado e com todos os requisitos de sistema instalados, no diretorio <strong>/web</strong> execute os seguintes passos:

instale as depêndencias do projeto

```bash 
npm install
```

Se deseja apenas testar, execute o projeto em <strong>ambiente de desenvolvimento:</strong>

```bash 
npm run dev # ambiente de testes e desenvolvimento
```

<strong>Caso queira criar uma build otimizada </strong>

```bash 
npm run build # Realiza o build
npx serve -s dist # Inicia o projeto buildado
```

Em ambos os casos, se tudo ocorrer conforme o esperado, uma mensagem será exibida na tela informando o endereço da aplicação.