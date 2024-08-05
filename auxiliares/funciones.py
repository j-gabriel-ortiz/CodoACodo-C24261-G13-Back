def talles_consulta(talles, id):
    dic_talles = {
        "xs": 1,
        "s": 2,
        "m": 3,
        "l": 4,
        "xl": 5,
        "xxl": 6
    }

    valores = [(id, valor, 1 if clave in talles else 0) for clave, valor in dic_talles.items()]
    return valores

def genero_ropa_consulta(generos, id):
    dic_gen = {
        "adolecente": 1,
        "mujer": 2,
        "hombre": 3,
        "gorra": 4
    }

    valores = [(id, dic_gen[genero]) for genero in generos]
    return tuple(valores)

def genero_ropa_editar(generos, id):
    dic_gen = {
        "adolecente": 1,
        "mujer": 2,
        "hombre": 3,
        "gorra": 4
    }

    valores = [(dic_gen[genero], id) for genero in generos]
    return tuple(valores)