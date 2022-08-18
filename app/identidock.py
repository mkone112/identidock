import os

from flask import Flask, Response, render_template, request
import httpx

from const import default_name
from utils import get_hash

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def mainpage():
    name = default_name
    if request.method == 'POST':
        name = request.form['name']
    name_hash = get_hash(name)
    return render_template('index.html', name=default_name, name_hash=name_hash)


@app.route('/monster/<name>')
def get_identicon(name):
    identicon_api = os.getenv('IDENTICON_API')
    identicon_size = os.getenv('IDENTICON_SIZE')
    identicon_url = f'{identicon_api}/monster/{name}?size={identicon_size}'
    request = httpx.get(identicon_url)
    image = request.content

    return Response(image, mimetype='image/png')


if __name__ == '__main__':
    # 0.0.0.0 позволяет забиндить все сетевые интерфейсы, что необходимо для
    # обеспечения доступа к контейнеру с хоста и других контейнеров
    app.run(debug=True, host='0.0.0.0')
