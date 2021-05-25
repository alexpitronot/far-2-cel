from flask import Flask
APP = Flask(__name__)


@APP.route('/')
def hello_world():
<<<<<<< HEAD
    return 'Our first Kubernetes app new'
=======
    return 'Our first Kubernetes app'
>>>>>>> c1ae04e3fe496ec05d7c602affb68e83401e1154



if __name__ == '__main__':
    APP.run(host='0.0.0.0', port=8080, debug=True)