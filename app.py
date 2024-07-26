from flask import Flask, request, jsonify, make_response
from dbhelpers import run_statement, check_endpoint_info

app = Flask(__name__)

@app.get('/api/item')
def get_items():
    try:
        result = run_statement("CALL get_all_items()")
        print(type(result))
        if (result):
            return make_response(jsonify(result), 200)
    except Exception as error:
        err = {}
        err["error"] = f"Error calling items: {error}"
        return make_response(jsonify(err), 400)

@app.post('/api/item')
def new_item():
    valid_check = check_endpoint_info(request.json, ['name', 'description', 'stock'])
    if(type(valid_check) == str):
        return valid_check

    name = request.json["name"]
    description = request.json["description"]
    stock = request.json["stock"]
    try:
        result = run_statement("CALL insert_new_item(?, ?, ?)", [name, description, stock])
        print(type(result))
        if (result):
            return make_response(jsonify(result), 200)
    except Exception as error:
        err = {}
        err["error"] = f"Error calling items: {error}"
        return make_response(jsonify(err), 400)

app.run(debug=True)