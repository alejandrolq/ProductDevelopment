from fastapi import FastAPI, Query
from typing import Optional, List
from enum import Enum


app = FastAPI()


class OpName(str, Enum):
    suma = 'suma'
    resta = 'resta'
    multiplicacion = 'multiplicacion'
    division = 'division'


def suma_(array_items):
    res = sum(array_items)
    return res


def resta_(array_items):
    res = array_items[0]
    for n in array_items[1:]:
        res = res - n
    return res


def multiplicacion_(array_items):
    res = 1
    for n in array_items:
        res = res * n
    return res


def division_(array_items):
    res = array_items[0]
    for n in array_items[1:]:
        res = res / n
    return res



@app.get("/")
def root():
    return {"message": "Hello World"}


@app.get("/suma")
def suma(array_items: List[float]= Query(None)):
    if array_items:
        return {"resultado": suma_(array_items)}
    return {"msg": "Ingrese datos validos"}


@app.get("/resta")
def resta(array_items: List[float]= Query(None)):
    if array_items:
        return {"resultado": resta_(array_items)}
    return {"msg": "Ingrese datos validos"}


@app.get("/multipliacion")
def multiplicacion(array_items: List[float]= Query(None)):
    if array_items:
        return {"resultado": multiplicacion_(array_items)}
    return {"msg": "Ingrese datos validos"}


@app.get("/division")
def division(array_items: List[float]= Query(None)):
    if array_items:
        return {"resultado": division_(array_items)}
    return {"msg": "Ingrese datos validos"}


@app.get("/operaciones")
def operaciones(opname: OpName, array_items: List[float]= Query(None)):
    if array_items:
        if opname == OpName.suma:
            return {"resultado": suma_(array_items)}
        if opname == OpName.resta:
            return {"resultado": resta_(array_items)}
        if opname == OpName.multiplicacion:
            return {"resultado": multiplicacion_(array_items)}
        if opname == OpName.division:
            return {"resultado": division_(array_items)}
    return {"msg": "Ingrese datos validos"}