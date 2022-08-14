from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'


if __name__ == '__main__':
    # 0.0.0.0 позволяет забиндить все сетевые интерфейсы, что необходимо для
    # обеспечения доступа к контейнеру с хоста и других контейнеров
    app.run(debug=True, host='0.0.0.0')
