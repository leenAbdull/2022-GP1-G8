from flask import Flask, request, jsonify
import json
import pickle
import sklearn
app = Flask(__name__)
model_body = pickle.load(open('nb.pkl', 'rb'))
vec_body = pickle.load(open("vec.pkl", "rb"))


@app.route('/', methods=['GET', 'POST'])
def hello_world():
    if (request.method == 'GET'):
        print('inn')
        # re-assigning response with the name we got from the user
        subject_phish = 'funds to share'
        body_phish = "The University of Washington System is sharing funds for all students during this pandemic, please update your \n financial aid status to claim yours. \nLogin.uw.edu/covid-19-aid-update\n For instructions on Accepting Your Financial Aid on https://login.uw.edu/login/login./.\n Regards,\n Assistant Professor \nUniversity of Washington"
        #features = subject_phish+body_phish

        subject_encoded = vec_body.transform([subject_phish]).reshape(1, -1)
        pred_sub = model_body.predict(subject_encoded)
           
        response = pred_sub
        print(response)
        return jsonify({'pred': response})  # to avoid a type error
#         return response
