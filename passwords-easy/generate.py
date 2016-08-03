#!/usr/bin/env python
import math
import operator
import os
import random
import re
import sys

import words

def seq_add(seqa, seqb):
	""" Adds sequences of the same length together. """
	return map(operator.add, seqa, seqb)

class Password:
	ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	ALPHABET_SET = set(ALPHABET)

	def __init__(self, password):
		self.password = password.upper()
		assert re.match("[{}]+$".format(Password.ALPHABET), self.password)

		p_len = float(len(self.password))
		self.password_mid = int(math.ceil(p_len / 2))

		# How many times each letter has been reported...
		self.letter_reported = None

	def GenerateLine(self):
		match_len = random.randrange(self.password_mid + 1)

		# Flip a coin for prefix or suffix
		if random.choice((False, True)) and match_len > 0:
			match = self.password[-match_len:]
			self.letter_reported = seq_add(self.letter_reported,
					[0] * (len(self.password) - match_len) + [1] * match_len)
		else:
			match = self.password[:match_len]
			self.letter_reported = seq_add(self.letter_reported,
					[1] * match_len + [0] * (len(self.password) - match_len))

		# Take out all the matching letters. This makes it much easier
		# for the contestants, but we can remove later if we like this
		# problem.
		junk_ltrs = list(Password.ALPHABET_SET - set(match))
		junk_len = random.randrange(2, 10)
		junk = ''.join((random.choice(junk_ltrs) for x in range(0, junk_len)))
		if random.choice((False, True)):
			guess = match + junk
		else:
			guess = junk + match

		return (guess, match_len)

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
		
	# Results will be biased towards the longest prefix/suffix as the last
	# result. Shuffle to make it less obvious.
	guesses = [x for x in p]
	random.shuffle(guesses)

	for guess, matches in guesses:
		i.write('{} {}\n'.format(guess, matches))
	o.write('{}\n'.format(p.password))

	i.close()
	o.close()

if __name__ == '__main__':
	main()
