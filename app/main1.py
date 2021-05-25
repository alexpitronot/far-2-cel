from flask import Flask
APP = Flask(__name__)


@APP.route('/')
def hello_world():
    return 'Our first Kubernetes app'



if __name__ == '__main__':
    APP.run(host='0.0.0.0')