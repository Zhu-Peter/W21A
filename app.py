from flask import Flask, request, jsonify, make_response
from dbhelpers import run_statement, check_endpoint_info

import mariadb
import dbcreds

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
    print(request.data)
    name = request.get_json(force=True)["name"]
    description = request.get_json(force=True)["description"]
    stock = int(request.get_json(force=True)["stock"])
    # conn = mariadb.connect(user=dbcreds.user, password=dbcreds.password,host=dbcreds.host, port=dbcreds.port, database=dbcreds.database)
    # cursor = conn.cursor()
    # cursor.execute("CALL insert_new_item(%s, %s, %s)", (name, description, stock))
    # conn.close()
    # return '0'
    try:

        result = run_statement("CALL insert_new_item(?, ?, ?)", [name, description, stock])
        print(type(result))
        if (result):
            return make_response(jsonify(result), 201)
    except Exception as error:
        err = {}
        err["error"] = f"Error adding items: {error}"
        return make_response(jsonify(err), 400)

@app.patch('/api/item')
def update_item():

    id = int(request.get_json(force=True)["id"])
    quantity = int(request.get_json(force=True)["quantity"])

    # conn = mariadb.connect(user=dbcreds.user, password=dbcreds.password,host=dbcreds.host, port=dbcreds.port, database=dbcreds.database)
    # cursor = conn.cursor()
    # cursor.execute("CALL update_item_quantity(%s, %s)", [id, quantity])
    # conn.commit()
    # conn.close()

    # return '0'
    try:
        result = run_statement("CALL update_item_quantity(?, ?)", [id, quantity])
        print(type(result))
        if (result):
            return make_response(jsonify(result), 201)
    except Exception as error:
        err = {}
        err["error"] = f"Error updating items: {error}"
        return make_response(jsonify(err), 400)

app.run(debug=True)