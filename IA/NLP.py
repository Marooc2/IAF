import nltk
from nltk.probability import *

#yo estudio en la universidad pero yo no quiero ir a la universidad

with open('hola.txt','r') as tempFile:
    rawText =  tempFile.read()
    from nltk import word_tokenize
    tokens = word_tokenize(rawText)
print(len(tokens))
print(set(tokens))
print(len(set(tokens)))
print(tokens.count('universidad'))
print(tokens.count('la'))
print(100 * tokens.count('universidad') / float(len(tokens)))
print(100 * tokens.count('la') / float(len(tokens)))
