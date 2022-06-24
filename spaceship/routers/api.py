from itertools import product
from fastapi import APIRouter
import numpy as np
import json

router = APIRouter()

@router.get('')
def hello_world() -> dict:
    return {'msg': 'Hello, World!'}

@router.get('/matrix')
def matrix() -> dict:
    matrix_a = np.random.randint(-20, 20, (10, 10))
    matrix_b = np.random.randint(-20, 20, (10, 10))
    product = np.dot(matrix_a, matrix_b)

    matrix_a_ret = json.dumps(matrix_a.tolist())
    matrix_b_ret = json.dumps(matrix_b.tolist())
    product_ret = json.dumps(product.tolist())

    return {'matrix_a': matrix_a_ret, 'matrix_b': matrix_b_ret, 'product': product_ret}