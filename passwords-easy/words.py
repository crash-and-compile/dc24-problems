import os
import random

__location__ = os.path.realpath(
    os.path.join(os.getcwd(), os.path.dirname(__file__)))

# Corpus originally generated from: LANG=C grep -E "^[A-Za-z]{6,}$" /etc/dictionaries-common/words

def random_word():
	with open(os.path.join(__location__, 'corpus.txt'), 'r') as corpus:
		return random.choice(corpus.readlines()).rstrip()

def random_words(num):
	with open(os.path.join(__location__, 'corpus.txt'), 'r') as corpus:
		words = corpus.readlines()
		return [random.choice(words).rstrip() for n in range(0, num)]

if __name__ == '__main__':
	print(random_word())
	print(' : '.join(random_words(3)))

