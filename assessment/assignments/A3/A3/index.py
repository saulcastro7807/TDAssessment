from flask import Flask, request
import math

app = Flask(__name__)


@app.route("/")
def message():
    return "\nAssessment App.\n\nAvailable endpoints:\n\n/square\n/cube\n/squareroot\nwith a number as payload. Examples:\n\nWith POST:\n{\n    \"number\": \"5\"\n}\n\nWith GET:\nhttp:localhost/square?number=5\n\n"

@app.route("/square", methods=['POST','GET'])
def square():
    try:
        if request.method == 'GET':
            req = request.args.get("number")
        else:
            req = request.get_json()["number"]
    except:
        return "\nNo variable named 'number' found in payload\n"
    try:
        number = float(req)
        square = number*number
    except:
        return "\nValue sent in variable 'number' could not be parsed as number or variable 'number' not found in payload\n"
    return "\n"+str(req)+" squared is: "+str(square)+"\n"


@app.route("/cube",methods=['POST','GET'])
def cube():
    try:
        if request.method == 'GET':
            req = request.args.get("number")
        else:
             req = request.get_json()["number"]
    except:
        return "\nNo variable named 'number' found in payload\n"
    try:
        number = float(req)
        cubed = number*number*number
    except:
        return "\nValue sent in variable 'number' could not be parsed as number or variable 'number' not found in payload\n"
    return "\n"+str(req)+" cubed is: "+str(cubed)+"\n"


@app.route("/squareroot",methods=['POST','GET'])
def sqrt():
    try:
        if request.method == 'GET':
            req = request.args.get("number")
        else:
             req = request.get_json()["number"]
    except:
        return "\nNo variable named 'number' found in payload\n"
    try:
        number = float(req)
        sqroot = math.sqrt(number)
    except:
        return "\nValue sent in variable 'number' could not be parsed as number or variable 'number' not found in payload\n"
    return "\nSquare root of "+str(req)+" is: "+str(sqroot)+"\n"
