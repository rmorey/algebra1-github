"""
This is an integer subtraction problem, where one number is negative, the other is positive. 
calculate has a new argument, that picks which number is negative, it flips half the time. 
"""


attach yaml_format.sage

myFile = open('algebra1.ch0.sec1.top6.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch0.sec1.top6.txt','a')


def calculate_difference_of_two_integers_opposite_signs(j,k,flip):
	l = flip*(j-k)
	return [l, [abs(j)+abs(k), -1*l, -1*(abs(j)+abs(k)), l+1, l-1, abs(j)+abs(k)+1, j*k, -1*j*k]]
	

def wrapper():
    for j in range(-10,0):
    	for k in range(11):
	    for flip in [1,-1]:
	    	[answer,distractors]= calculate_difference_of_two_integers_opposite_signs(j,k,flip)
		answer_list= make_answer_list(answer,distractors,3)
		if answer_list:
		   [question_string,answer_list_strings]=format_difference_of_whole_numbers([flip*j,flip*k],answer_list)
		   insert_html_html_multiple_question("Calculate the difference",question_string,answer_list_strings,myFile)
    myFile.close()

def format_difference_of_whole_numbers(list,answer_list):
    answer_list_strings= [str(element) for element in answer_list]
    return ["{first_number}-{second_number}".format(first_number=list[0], second_number=list[1]),answer_list_strings]
