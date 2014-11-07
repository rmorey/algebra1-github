'''
This is testing the truth of statements of inequality, with or equal inequalities
'''

attach yaml_format.sage
import random

myFile = open('algebra1.ch6.top0.prac2.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch6.top0.prac2.txt','a')

def test_inequality(x, y, sign): 
	truth_of_statement = (x >= y and sign == "\geq") or (x <= y and sign == "\leq")
	opposite_of_truth_of_statement = not truth_of_statement
	return [truth_of_statement, opposite_of_truth_of_statement]
	
def format_test_inequality(x, y, sign, truth_of_statement):
	opposite_of_truth_of_statement = not truth_of_statement
	question_string = "\[ " + latex(x) + sign + latex(y) + " \]"
	answer_list_strings = [str(truth_of_statement), str(opposite_of_truth_of_statement)]
	return [question_string,answer_list_strings]
	
proportion = 200.0/882.0
print "882 possible questions"

def wrapper():
	question_count = 0
	for x in range(-10,11):
		for y in range(-10,11):
			for sign in ["\leq", "\geq"]:
				if random.random() < proportion:
					[truth_of_statement, opposite_of_truth_of_statement] = test_inequality(x, y, sign)
					[question_string,answer_list_strings] = format_test_inequality(x, y, sign, truth_of_statement)
					insert_html_html_multiple_question("Is this statement true or false?",question_string,answer_list_strings,myFile)
					question_count += 1
	myFile.close()
	print str(question_count) + " questions printed to file"