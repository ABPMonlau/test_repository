from flask import Flask
from flask_cors import CORS
from controller.controller import main_blueprint

app = Flask(__name__)
CORS(app)

# Registramos el Blueprint definido en el controlador
app.register_blueprint(main_blueprint)

if __name__ == "__main__":
    app.run(debug=True)
