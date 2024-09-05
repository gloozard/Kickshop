from flask import Flask, render_template,url_for

kickshop = Flask(__name__)

@kickshop.route("/")
def home():
    return render_template('home.html')

@kickshop.route("/signup")
def signup():
    return render_template('signup.html')

@kickshop.route("/signin")
def signin():
    return render_template('signin.html')
if __name__ == '__main__':  
   kickshop.run(port=3300, debug=True) 