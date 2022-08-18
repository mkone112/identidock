import hashlib

from const import salt


def get_hash(text):
    salted = f'{salt}{text}'
    salted = salted.encode()
    text_hash = hashlib.sha256(salted)
    return text_hash.hexdigest()
