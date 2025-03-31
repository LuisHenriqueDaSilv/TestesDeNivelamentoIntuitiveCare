<div align="center">

# Teste 3: 
Teste de banco de dados
</div>

<p>Neste teste, foram desenvolvidas queries SQL que, tendo como entrada os arquivos públicos <a href="https://dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/">"demonstracoes_contabeis"</a> e <a href="https://dadosabertos.ans.gov.br/FTP/PDA/operadoras_de_plano_de_saude_ativas/">"operadoras_de_plano_de_saude_ativas"</a>, criam as tabelas necessárias em um banco de dados MySQL 8 para armazenar os registros dos arquivos CSV e importam todos os dados. Além disso, foram desenvolvidas queries analíticas que listam as 10 operadoras com as maiores despesas em "EVENTOS/SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE MÉDICO-HOSPITALAR" no último trimestre e no último ano.
</p>

## Requisitos de sistema
- Algum sistema de banco de dados (Para testes, recomenda-se utilizar o MySql dentro de um <a href="https://www.docker.com/">Docker</a>, utilizando o <a href="https://docs.docker.com/compose/">Docker-Compose</a>)
- Alguma ferramenta para executar as queries SQL no banco de dados. (Durante o desenvolvimento das queries foi utilizado o [beekeeper](https://www.beekeeperstudio.io/) )

## Como executar

### Iniciando um banco de dados MySQL com Docker-Compose:
Tendo o Docker e o Docker-Compose instalados em sua máquina, utilize o seguinte comando no terminal Linux para iniciar o servidor MySQL, utilizando os arquivos docker-compose.yml e init.sql disponibilizados:

```bash
sudo docker compose up --build
```
Isso garantirá que o banco de dados seja inicializado corretamente com as configurações definidas nos arquivos fornecidos e compatíveis com as queries desenvolvidas.

### rodando as queries

Utilize a ferramenta de sua preferência para executar as queries disponíveis no diretório "/src". 

As queries são:

<strong> registrar_relatorioCadop.sql:</strong> queries responsáveis por criar a tabela operadorasDePlanoDeSaudeAtivas, ler os arquivos .csv e registrar cada linha no banco de dados.

<strong>registrar_demonstracoesContabeis.sql:</strong>  queries responsáveis por criar a tabela demonstracoesContabeis, ler os arquivos .csv e registrar cada linha no banco de dados.

<strong>analise_ultimo_trimestre_demonstracoesContabeis.sql</strong>: (É necessário popular o banco de dados previamente com o script registrar_demonstracoesContabeis.sql). Executa uma consulta que retorna as 10 operadoras com as maiores despesas em "EVENTOS/SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE MÉDICO-HOSPITALAR" no último trimestre.

<strong>analise_ultimo_ano_demonstracoesContabeis.sql</strong>: (É necessário popular o banco de dados previamente com o script registrar_demonstracoesContabeis.sql). Executa uma consulta que retorna as 10 operadoras com as maiores despesas em "EVENTOS/SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE MÉDICO-HOSPITALAR" no último ano.