import json
from flask import Flask, request, jsonify
import numpy as np
import pickle
import sklearn
model = pickle.load(open('nb.pkl', 'rb'))
# vec_body = pickle.load(open("vec.pkl", "rb"))
vec = pickle.load(open("bag_words.pkl", "rb"))



app = Flask(__name__)

# declared an empty variable for reassignment
response = ''


@app.route('/', methods=['GET', 'POST'])
def pred():
    global response
    # checking the request type we get from the app
    if (request.method == 'POST'):
        print('inn')
        data = request.data
        request_data = json.loads(data.decode('utf-8'))
        subject = request_data['subject']
        body = request_data['body']
        features = " ".join([subject, body])
        encode = vec.transform([features]).toarray()
        bag_of_words = pd.DataFrame(
                encode, columns=vec.get_feature_names_out())

        # features_encoded = vec.transform([encode]).reshape(1, -1)
        prediction = model.predict(encode)

        # response = f"Hi! this Post "+pred_sub+"is Python"
        response = f'{prediction}'
        print(response)
        return jsonify({'pred': response})  # to avoid a type error
    else:
        # sending data back to your frontend app
        subject = 'funds to share'
        body = "The University of Washington System is sharing funds for all students during this pandemic, please update your \n financial aid status to claim yours. \nLogin.uw.edu/covid-19-aid-update\n For instructions on Accepting Your Financial Aid on https://login.uw.edu/login/login./.\n Regards,\n Assistant Professor \nUniversity of Washington"

        features = " ".join([subject, body])
        encode = vec.transform([features]).toarray()
        bag_of_words = pd.DataFrame(
                encode, columns=vec.get_feature_names_out())

        prediction = model.predict(encode)


        # response = f"Hi! this Post "+pred_sub+"is Python"
        response = f'{prediction}... {bag_of_words} '
        print(response)       
        return jsonify({'pred': response})


'''
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
        
        features = " ".join([subject_phish, body_phish]) #subject_phish+body_phish

        subject_encoded = vec_body.transform([features]).reshape(1, -1)
        pred_sub = model_body.predict(subject_encoded)
           
        response = pred_sub
        return jsonify({'pred': 'response' })
#         return 'respone {response}'
'''
