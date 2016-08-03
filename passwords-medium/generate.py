#!/usr/bin/env python
import os
import random
import re
import sys

import words

class Password:
	ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

	def __init__(self, password):
		self.password = password.upper()

		assert re.match("[{}]+$".format(Password.ALPHABET), self.password)

		# How many times each letter has been reported...
		self.letter_reported = None

	def GenerateLine(self):
		guess = ''.join((random.choice(Password.ALPHABET) for x in range(0, len(self.password))))
		matches = 0
		for i, l in enumerate(guess):
			if l == self.password[i]:
				self.letter_reported[i] += 1
				matches += 1

		return (guess, matches)

	def __iter__(self):
		self.letter_reported = [0] * len(self.password) # Super bad practice...
		return self

	def next(self):
		if all((x >= 2 for x in self.letter_reported)):
			raise StopIteration()

		return self.GenerateLine()
		

def main():
	p = Password(words.random_word())
        if len(sys.argv) == 3:
                i = open(os.path.join('input', sys.argv[1]), 'w')
                o = open(os.path.join('output', sys.argv[2]), 'w')
        else:   
                i = sys.stdout
                o = sys.stdout

        for guess, matches in p:
                i.write('{} {}\n'.format(guess, matches))
        o.write('{}\n'.format(p.password))

        i.close()
        o.close()


if __name__ == '__main__':
	main()

