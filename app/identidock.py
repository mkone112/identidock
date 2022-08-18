from flask import Flask, render_template

app = Flask(__name__)

default_name = 'Joe Blogs'


@app.route('/')
def get_identicon():
    return render_template('index.html', name=default_name)


if __name__ == '__main__':
    # 0.0.0.0 позволяет забиндить все сетевые интерфейсы, что необходимо для
    # обеспечения доступа к контейнеру с хоста и других контейнеров
    app.run(debug=True, host='0.0.0.0')
