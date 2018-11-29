# Crear una gramatica
import nltk
from nltk import CFG
from nltk.parse.generate import generate

Gramtica1 = CFG.fromstring("""

F -> SU P
SU -> 'juan' | 'pedro' | 'maria' | 'salgado'
P -> VT OD
P -> VI
VT -> 'ama' | 'lava' | 'peina' | 'adora'
OD -> 'paula' | 'antonio' | 'sultan'
VI -> 'corre' | 'salta' | 'camina'
""")

print('La gramatica:', Gramtica1)
print('Inicio =>', Gramtica1.start())
print('Productiones =>')

# Mostrar las producciones de la gramatica
print(Gramtica1.productions())

print('Cobertura de palabras ingresadas a la gramatica:')

try:
    #maría ama antonio
    Gramtica1.check_coverage(['maria', 'ama', 'antonio'])
    print("Todas las palabras estan cubiertas")
except:
    print("Error")


for sentence in generate(Gramtica1, n=50):
    print(' '.join(sentence))

Frese = ['maria', 'ama', 'antonio']
parser = nltk.ChartParser(Gramtica1)
for Arbol in parser.parse(Frese):
    print(Arbol)

