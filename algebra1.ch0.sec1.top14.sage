"""
This is simple integer subtraction with whole numbers, with x's

"""

attach yaml_format.sage

myFile = open('algebra1.ch0.sec1.top14.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch0.sec1.top14.txt','a')

def calculate_difference_of_whole_numbers(j,k):
    l = j-k
    return [l, [abs(j)+abs(k), -1*l, -1*(abs(j)+abs(k)), l+1, l-1, abs(j)+abs(k)+1, j*k, -1*j*k]]

def wrapper():
    for j in range(11):
    	for k in range(11):
	    [answer,distractors]= calculate_difference_of_whole_numbers(j,k)
	    answer_list= make_answer_list(answer,distractors,3)
	    if answer_list:
	       [question_string,answer_list_strings]=format_difference_of_whole_numbers([j,k],answer_list)
	       insert_html_html_multiple_question("Calculate the difference",question_string,answer_list_strings,myFile)
    myFile.close()

def format_difference_of_whole_numbers(list,answer_list):
    answer_list_strings= ["\("+latex(element*x)+"\)" for element in answer_list]
    question_string = "\("+latex(list[0]*x)+"-"+latex(list[1]*x)+"\)"
    return [question_string, answer_list_strings]