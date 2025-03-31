<template>
    <section class="ANSResult">
        <header>
            <h2>{{data.Nome_Fantasia}}</h2>
            <p>{{ data.Razao_Social }}.</p>
        </header>
        
        <div class="ansDetailsContainer">
            <div>
                <dt>Registro ANS</dt>
                <dd>{{ data.Registro_ANS }}</dd>

                <dt>CNPJ</dt>
                <dd>{{ data.CNPJ }}</dd>

                <dt>Modalidade</dt>
                <dd>{{ data.Modalidade }}</dd>

                <dt>Data Registro ANS</dt>
                <dd>{{ data.Data_Registro_ANS }}</dd>
            </div>
            <div>
                <dt>Endereço</dt>
                <dd>{{ data.Logradouro }}, {{data.Numero}}, {{data.Complemento}}</dd>
                <dd>{{data.Bairro}}-{{ data.Cidade }}/{{data.UF}}</dd>
                <dd>CEP: {{ data.CEP }}</dd>
    
                <dt>Contato</dt>
                <dd>📞 ({{ data.DDD }}) {{ data.Telefone }}</dd>
                <dd>📧 {{data.Endereco_eletronico}}</dd>
            </div>
        </div>
        <footer>
            <h3>Representante Legal</h3>
            <div>
                <img src="/profile.png"/>
                <div class="legalRepresentativeInfos">
                    <p><strong>{{ data.Representante }}</strong></p>
                    <p>{{data.Cargo_Representante}}</p>
                </div>
            </div>
        </footer>
    </section>
</template>

<script setup>
    defineProps({
        data: Object, // Define que o prop `data` é um objeto
    });
</script>

<style>
    .ANSResult {
        background: #FFFFFF;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1), 0px 4px 6px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        max-width: 90rem;
        width: 100%;
    }

    .ANSResult header {
        display: flex;
        flex-direction: column;
        padding: 2rem;
        gap: 1rem;

        border-bottom: 1px solid #E5E7EB;
        border-radius: 0px;

    }

    .ANSResult header h2 {
        font-size: 2.4rem;
        font-weight: bold;
    }

    .ANSResult header p {
        font-size: 1.6rem;
        font-weight: 400;
        color: #4B5563;
    }

    .ansDetailsContainer {
        display: flex;
        flex-direction: row;
        padding: 2rem;
        gap: 2rem;
    }

    .ansDetailsContainer div {
        width: 100%;
    }

    dt {
        margin-bottom: 0.6rem;
        color: #6B7280;
        font-size: 1.4rem;
    }
    
    dd {
        margin-bottom: 2rem;
        font-weight: bold;
        color: #000000;
        font-size: 1.6rem;
    }

    footer {
        border-top: 1px solid #E5E7EB;
        border-radius: 0px;
        padding: 2rem;
        display: flex;
        flex-direction: column;
        gap: 2rem;
    }
    
    footer h3 {
        font-weight: 600;
    }

    footer > div {
        display: flex;
        flex-direction: row;
        align-items: center;
        gap: 1rem;
    }

    .legalRepresentativeInfos {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 4.2rem;
    }

    .legalRepresentativeInfos p {
        font-weight: 400;
        color: #4B5563;
        font-size: 1.6rem;
    }

    .legalRepresentativeInfos strong {
        font-weight: 700;
        color: #000000;
    }
</style>