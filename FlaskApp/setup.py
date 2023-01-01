import json
from flask import Flask, request, jsonify
# import numpy as np
import pickle
import string
model_body = pickle.load(open('nb.pkl', 'rb'))
vec_body = pickle.load(open("vec.pkl", "rb"))

# model_sub = pickle.load(open('nb_sub.pkl', 'rb'))
# vec_sub = pickle.load(open("vec_sub.pkl", "rb"))
app = Flask(__name__)

# declared an empty variable for reassignment
response = ''


@app.route('/api', methods=['GET', 'POST'])
def pred():
    global response
    # checking the request type we get from the app
    if (request.method == 'GET'):
        print('inn')
        # re-assigning response with the name we got from the user
        subject_phish = 'funds to share'
        body_phish = "The University of Washington System is sharing funds for all students during this pandemic, please update your \n financial aid status to claim yours. \nLogin.uw.edu/covid-19-aid-update\n For instructions on Accepting Your Financial Aid on https://login.uw.edu/login/login./.\n Regards,\n Assistant Professor \nUniversity of Washington"
        features = "{subject_phish} {body_phish}"

        subject_encoded = vec_body.transform([features]).reshape(1, -1)
        pred_sub = model_body.predict(subject_encoded)
           

        response = f'Hi! this Post {pred_sub} is Python'
        print(response)
        return jsonify({'pred': response})  # to avoid a type error
    else:
        # sending data back to your frontend app
        response = f'Hi ! this is else '
        return jsonify({'pred': response})


if __name__ == "__main__":
    app.run(debug=True)
