import json
from flask import Flask, request, jsonify
import numpy as np
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

        legit_sub = "sporting clays reminder !"
        legit_body = "don \' t forget the nesa / hea 5 th annual sporting clays tournament is just around the corner ! august 14 th will be here soon , and the slots are filling up ! the first flight of 100 targets is almost full , so if you want to shoot early , get your registration and payment in pronto !attached is the pdf file with all the pertinent information you need for this great event . our sporting clays committee has done a great job , and we ' re appreciative of all the sponsors who have committed to help out this year ! they include : coral energy ; duke energy field services ; el paso field services ; entex gas resources ; houston pipe line / aep ; reliant energy field services ; reliant energy services ; mitchell gas services ; mirant americas energy marketing ; \nreliant energy pipeline services ; reliant energy gas transmission ; \n richardson energy marketing ; oneok energy marketing wilson ; \n entergy ; cms ; enron north america ; texican natural gas ; and the dow corp . \n so be sure to get your registration and payment in before august 1 to be part of the \" private drawing \" ! you don ' t want to miss this great outing .\nget your team together and register today ."
        features1 = "{legit_sub} {legit_body}"

        phishy_sub = "confirmation message"
        phishy = "Thank you \n \n Hi user, \n We are sending you this email to confirm that 2 items that you placed has been processed and will be shipped within next 24Hrs. for \n ID  # RDW18-1954878601 placed on March 17 2021. \nThank you for shopping with amazon \nORDER HELP-DESK: 1-205-336-3187 \n ORDER DETAILS \n New MacBook Pro with Apple M1 Chip(13-inch, 8GB RAM, 256GB SSD Storage) - Space Gray(Latest Model) \n MODEL No.: MYD82LLIA \n QTY: 1 \n PRICE: $1199.99 $1299.99 \n Delivery by: Tuesday, 23rd Mar \n AirPods with Wireless Charging Case \n MODEL No.: MRXJ2AM/A \n QTY: 1 \n PRICE: $149.99 $199.99 \n Delivery by: Tuesday, 23rd Mar"

        features2 = "{phishy_sub} {phishy}"

        subject_encoded = vec_body.transform([features]).reshape(1, -1)
        pred_sub = model_body.predict(subject_encoded)

        subject_encoded1 = vec_body.transform([features1]).reshape(1, -1)
        pred_sub1 = model_body.predict(subject_encoded1)

        subject_encoded2 = vec_body.transform([features2]).reshape(1, -1)
        pred_sub2 = model_body.predict(subject_encoded2)

        phish_b = "Description Reply Me Urgently Please\ My name is Mrs Rose Robert, I have been surffering from Ovarian cancer\n disease and the doctor says that i have just few days to leave.I am \nfrom Belgium, but based in Burkina Faso, Africa since ten years ago as \n a business woman dealing with cocoa exportation, now that i am about to \n end the race like this without any family members and no child. I have \n $1 Million US DOLLARS in EcoBank here in Burkina Faso which i instructed \n the bank to give African union leaders to help sick people around Africa. \n But my mind is not at rest because of that i am writing thisletter now \n through the help of my Doctor beside me here in n my hospital room. I also have $3.1 Million US Dollars in Bank Of Africa \nBurkina Faso"
        phish_s = "suffering"
        features3 = "{phishy_s} {phish_b}"

        subject_encoded3 = vec_body.transform([features3]).reshape(1, -1)
        pred_sub3 = model_body.predict(subject_encoded3)

        legit_b = "Hi Maha, \n\n You can now choose your channel’s handle.\nAs a reminder, in most cases, if you already have a personalized URL for your channel, we’ve reserved this for you as your handle. If you’re happy with that handle then you’re all set. If you want a different handle from the one we reserved, you can change it. If you don’t already have a personalized URL today, you’ll also be able to choose a handle. Keep in mind that handles are unique to each channel, so once a handle has been chosen, it can’t be selected by anyone else."
        Legit_s = "You can now choose your YouTube handle"
        features4 = "{legit_s} {legit_b}"

        subject_encoded4 = vec_body.transform([features4]).reshape(1, -1)
        pred_sub4 = model_body.predict(subject_encoded4)

        print(pred_sub)
        print(pred_sub1)
        print(pred_sub2)
        print(pred_sub3)
        print(pred_sub4)

        '''
        # tp = np.array(subject)
        # fp = np.array(body)
        # features = np.vstack((tp, fp)).T
        subject_encoded = vec.transform([subject]).reshape(1, -1)
        body_encoded = vec.transform([body]).reshape(1, -1)
        inp = [subject_encoded]

        prediction = model.predict(subject_encoded)
        prediction2 = model.predict(body_encoded)
        '''
        '''
                le = preprocessing.LabelEncoder()

                def remove_punctuation(text):
            punctuationfree = "".join(
                [i for i in text if i not in string.punctuation])
            return punctuationfree

        # body = (lambda x: remove_punctuation(x))
        # subject = np.array([subject])
        # body = np.array([body])

        # SUBJECT_encoded = le.transform(subject)
        # BODY_encoded = le.transform(body)
        # print(SUBJECT_encoded)
        # print(BODY_encoded)

        # tp = np.array(SUBJECT_encoded)
        # fp = np.array(BODY_encoded)
        # features = np.vstack((tp, fp)).T

        # from sklearn.feature_extraction.text import CountVectorizer
        # vectorizer = CountVectorizer()
        # message_bow = vectorizer.fit_transform(body)
        # # message_bow.toarray()

        # input_cols = [features, message_bow]
        # # input_cols.reshape(-1, 1)

        # prediction = model.predict(message_bow)
        '''

        response = f'Hi! this Post {pred_sub} {pred_sub1} {pred_sub2} is Python'
        print(response)
        return jsonify({'pred': response})  # to avoid a type error
    else:
        # sending data back to your frontend app
        response = f'Hi ! this is else '
        return jsonify({'pred': response})


if __name__ == "__main__":
    app.run(debug=True)
