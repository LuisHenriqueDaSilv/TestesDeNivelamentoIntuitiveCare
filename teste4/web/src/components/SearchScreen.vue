<template>
    <div class="wrapper">

        <form @submit.prevent="handleFormSubmit" class="searchForm">
            <h1>Pesquisar Operadora</h1>
            <div class="formContentWrapper">
                <div class="queryInput">
                    <input v-model="query" type="text" required/>
                    <span>Digite o Registro ANS ou CNPJ</span>
                </div>
                <button type="submit">
                    <img src="/searchIcon.png"/>
                    Pesquisar
                </button>
            </div>
        </form>
        <div class="ansResultContainer">
            <ANSResult v-for="(ans, index) in results" :key="index" :data="ans" />
             <div v-if="results">
                <button v-if="page != 0" @click="handlePreviousPage" class="pageButton"> << </button>
                 {{ page+1 }}
                <button @click="handleNextPage" v-if="enableNextPage" class="pageButton"> >> </button>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
    import ANSResult from './ANSResult.vue';
    import axios from "../services/axios"
    import {ref} from "vue"

    const query = ref()
    const results = ref()
    const enableNextPage = ref()
    enableNextPage.value = true
    
    const page = ref()
    page.value = 0

    function handleFormSubmit(){
        page.value = 0
        enableNextPage.value = true
        search()
    }

    async function search(){
        try {
            const response = await axios.get(`/search?query=${query.value}&page=${page.value}`)
            results.value=response.data
            if(results.value.length == 0){
                enableNextPage.value = false
            } else {
                enableNextPage.value = true
            }
        } catch (error) {
            results.value = [];
            enableNextPage.value = false
        }
    }

    function scrollToTop() {
        window.scrollTo({ top: 0, behavior: "smooth" });
    }

    async function handleNextPage(){
        if(enableNextPage){
            page.value++;
            await search()
            scrollToTop()
        }
    }

    async function handlePreviousPage(){
        if(page.value > 0){
            page.value--;
            await search()
            scrollToTop()
        }
    }

</script>

<style scoped>

    .pageButton {
        border: none;
        background: none;
        color: blue;
        font-size: 2rem;
        cursor: pointer;
    }

    .pageButton:hover {
        opacity: 0.7;
    }
    .wrapper {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 3rem;
        margin-top: 4rem;
        /* background-color: purple; */
    }

    .searchForm {
        display: flex;
        flex-direction: column;
        padding: 2rem;
        width: 90%;
        max-width: 67rem;
        gap: 3rem;
        /* div */

        background: #FFFFFF;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1), 0px 4px 6px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    .searchForm h1 {
        font-size: 2rem;
        font-weight: 600;
    }

    .searchForm div {
        display: flex;
        flex-direction: row;
    }

    .queryInput {
        position: relative;
        width: 100%;
    }

    .queryInput > input {
        width: 100%;
        outline: none;
        padding: 1.3rem 2rem;

        border: 1px solid #D1D5DB;
        border-radius: 6px;
    }

    .queryInput > span {
        position: absolute;
        left: 1rem;
        top: 1.5rem;
        opacity: 0.4;
        pointer-events: none;
        transition: 0.3s;
    }

    .queryInput input:focus~span,
    .queryInput input:valid~span
    {
        transform: translateY(-4rem);
        opacity: 0.7;
        left: 0.2rem;
    }

    .formContentWrapper {
        display: flex;
        gap: 2rem;
        flex-direction: row;
    }

    .formContentWrapper button {
        display: flex;
        gap: 1rem;
        padding: 0 1.4rem;
        flex-direction: row;
        background: #2563EB;
        border-radius: 6px;
        border: none;
        justify-content: center;
        align-items: center;
        font-size: 1.6rem;
        color: #ffffff;
        transition: 200ms;
        cursor: pointer;
    }

    .formContentWrapper button:hover {
        opacity: .7;
    }

    .formContentWrapper button img {
        height: 19px;
        width: 16px;
    }

    .ansResultContainer {
        display: flex;
        flex-direction: column;
        width: 90%;
        gap: 2rem;
        margin-bottom: 5rem;
        align-items: center;
    }

    @media (max-width: 768px){
        .formContentWrapper {
            flex-direction: column !important;
        }
        .formContentWrapper button{
            height: 5rem;
        }
    }

</style>