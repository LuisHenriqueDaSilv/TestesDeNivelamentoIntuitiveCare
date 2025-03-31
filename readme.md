<div align="center">

# TESTES DE NIVELAMENTO v.250321 - Intuitive Care

</div>

## Sobre os testes
O repositório é dividido em quatro pastas, sendo cada uma um teste: 

### Teste 1: Web Scraper Python
Neste teste, foi desenvolvido um algoritmo em Python que acessa o site <a href="https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos">"O Rol de Procedimentos e Eventos em Saúde"</a>, baixa os dois anexos e os compacta em um único arquivo .zip

## Teste 2: Transformação de dados
Neste teste, foi desenvolvido um algoritmo em Python que, tendo como entrada o <strong>Anexo I</strong> do teste anterior, extrai todos os dados da tabela Rol de Procedimentos e Eventos em Saúde e os salva em uma tabela estruturada no formato CSV. Além disso, o algoritmo substitui abreviações nos registros por suas descrições completas, conforme a legenda. Por fim, o arquivo CSV é compactado em um arquivo Teste_LuisHenriqueDaSilva.zip.

## Teste 3: Teste de banco de dados

Neste teste, foram desenvolvidas queries SQL que, tendo como entrada os arquivos públicos <a href="https://dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/">"demonstracoes_contabeis"</a> e <a href="https://dadosabertos.ans.gov.br/FTP/PDA/operadoras_de_plano_de_saude_ativas/">"operadoras_de_plano_de_saude_ativas"</a>, criam as tabelas necessárias em um banco de dados MySQL 8 para armazenar os registros dos arquivos CSV e importam todos os dados. Além disso, foram desenvolvidas queries analíticas que listam as 10 operadoras com as maiores despesas em "EVENTOS/SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE MÉDICO-HOSPITALAR" no último trimestre e no último ano.

## Teste 4: Um sistema FullStack
Neste teste, foi desenvolvido um sistema de busca de operadoras de planos de saúde utilizando Python/Flask no backend e Vue.js no frontend web. O sistema permite buscar operadoras pelo CNPJ, número de registro na ANS ou qualquer outro campo relevante, exibindo detalhes como nome, endereço e número de registro. Para a comunicação entre frontend e backend, foi utilizado Axios, garantindo requisições eficientes. Além disso, a interface foi projetada para ser responsiva e intuitiva, proporcionando uma melhor experiência ao usuário.
</br>
<div align="center">
    <img width="50%" src="https://i.imgur.com/Y5LRn8n.png"/>
</div>

## ⚠️ Como testar ⚠️
Cada pasta do repositório contém um arquivo README.md que descreve tudo o que é necessário para executar os algoritmos e projetos, incluindo listas de requisitos, descrições detalhadas e outras informações relevantes.