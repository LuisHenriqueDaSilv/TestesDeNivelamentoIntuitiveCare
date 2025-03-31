<template>
    <header>
        <div class="logoContainer">
            <img src="/logo.png" alt="Logo consulta ANS"/>
            <h1>Consulta ANS</h1>
        </div>  
    </header>
</template>

<style scoped>
    header {
        background: #FFFFFF;
        box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.05);
        padding: 2rem 6rem;
    }

    .logoContainer {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        gap: 2rem;
        width: fit-content;
    }

    .logoContainer h1 {
        font-size: 2.0rem;
        font-weight: bold;
        color: #1F2937;
    }

    @media (max-width: 768px) {
        .logoContainer {
            width: 100%;
        }
    }

</style>