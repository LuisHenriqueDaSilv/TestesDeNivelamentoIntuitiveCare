from flask import Flask, request, jsonify
import logging
import pandas as pd
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.get("/search")
def getIndex():
    try:
        query = request.args.get("query")
        page = request.args.get("page")

        if not page or not page.isnumeric():
            page = 0
        else:
            page = int(page)
        pageIndex = page*10

        csvdata = pd.read_csv("datas/Relatorio_cadop.csv", delimiter=";", dtype=str)
        csvdata.fillna('', inplace=True)
        csvdata_lower = csvdata.apply(lambda x: x.astype(str).str.lower())
        
        results = None
        
        if not query: # if query is empty, just send the firsts records
            results = csvdata.iloc[pageIndex:pageIndex+10]
        else:
            search_in = csvdata.columns
            search_term = query.lower()
            csvdata_lower['relevance'] = csvdata_lower[search_in].apply(lambda x: sum(search_term in str(valor) for valor in x), axis=1)

            results = csvdata[csvdata_lower["relevance"] > 0].copy()
            results["relevance"] = csvdata_lower["relevance"]
            results = results.sort_values(by="relevance", ascending=False)
            del results["relevance"]
            results = results.iloc[pageIndex:pageIndex+10]

        if results.empty or results.isnull().all().all():
            return jsonify([]), 200
        
        return results.to_json(orient="records"), 200
    
    except Exception as error:
        logging.error(f"An unexpected error occurred: {error}")
        return "An unexpected error occurred", 400