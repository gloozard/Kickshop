from flask import Flask, render_template,url_for

kickshop = Flask(__name__)

@kickshop.route("/")
def home():
    return render_template('index.html')

if __name__ == '__main__':  
   kickshop.run(port=3300, debug=True) 