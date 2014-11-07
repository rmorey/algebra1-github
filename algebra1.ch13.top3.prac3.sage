'''
In how manys ways can you rearrange the letters in the word x,
where x is each of the states in the United States.
'''
y = var('y')
attach yaml_format.sage
import random
import time


states = ['Mississippi', 'Oklahoma', 'Wyoming', 'Minnesota', 'Illinois', 'Arkansas', 'New Mexico', 'Indiana', 'Louisiana', 'Texas', 'Wisconsin', 'Kansas', 'Connecticut', 'California', 'West Virginia', 'Georgia', 'North Dakota', 'Pennsylvania', 'Alaska', 'Missouri', 'South Dakota', 'Colorado', 'New Jersey', 'Washington', 'New York', 'Nevada', 'Maryland', 'Idaho', 'Arizona', 'Iowa', 'Michigan', 'Utah', 'Virginia', 'Oregon', 'Montana', 'New Hampshire', 'Massachusetts', 'South Carolina', 'Vermont', 'Florida', 'Hawaii', 'Kentucky', 'Rhode Island', 'Nebraska', 'Ohio', 'Alabama', 'North Carolina', 'Tennessee', 'Delaware', 'Maine']


def rearrangements_of_letters_in_word(word):
	answer = rearrangements(make_sorted_word_list(word))
	simple_factorial = factorial(len(make_sorted_word_list(word)))
	simple_factorial_plus1 = factorial(len(make_sorted_word_list(word))+1)
	simple_factorial_minus1 = factorial(len(make_sorted_word_list(word))-1)
	wrong_answer_to_begin_with = [answer,simple_factorial,simple_factorial_plus1,simple_factorial_minus1]
	distractors = [item/divisor for item in  wrong_answer_to_begin_with for divisor in [1,2,6,24] if item % divisor == 0 and item/divisor >= 24 and item/divisor <= simple_factorial_plus1]
	return [answer,distractors]               

def make_sorted_word_list(word):
	word = word.lower()
	word = word.replace(' ','')
	word_list = list(word)
	word_list = sorted(word_list)
	return word_list

'''
rearrangements of a list of letters in a word
'''
def rearrangements(word_list):
	total_multiplier = 1
	current_letter = word_list[0]
	current_multiplier = 1
	for letter in word_list[1:]:
		if current_letter == letter:
			current_multiplier += 1
		else:
			current_letter = letter
			total_multiplier *= factorial(current_multiplier)	
			current_multiplier = 1
	total_multiplier *= factorial(current_multiplier)		
	return factorial(len(word_list))/total_multiplier
		
def format_rearrangements_of_letters_in_word(word,answer_list):
	question_string = word 
	answer_list_strings=[]
	for answer in answer_list:
		answer_list_strings.append("{:,}".format(answer))		
	return [question_string, answer_list_strings]	

			
def wrapper():
	myFile = open('algebra1.ch13.top3.prac3.txt','w')
	create_html_html_multiple_question_set(myFile)
	myFile.close()
	myFile = open('algebra1.ch13.top3.prac3.txt','a')

	question_count = 0
	time_start = time.time()
	for word in states:		
			if random.random() < 1.0:
				[answer,distractors] = rearrangements_of_letters_in_word(word)				       
				answer_list= make_answer_list(answer,distractors,3)
				if answer_list:
					[question_string,answer_list_strings]=format_rearrangements_of_letters_in_word(word,answer_list)
					insert_html_html_multiple_question("How many ways can you rearrange the letters in the following word?",question_string,answer_list_strings,myFile)
					question_count += 1
	myFile.close()
	time_end = time.time()
	print str(question_count) + " questions printed to file in " + str(int(time_end) - int(time_start)) + " seconds."