class MyClass(object):
    def __init__(self, name, num_students):
        self.name = name
        self.num_students = num_students
        self.questions = []
        self.answer_list = []

    def question(self, question):
        self.questions.append(question)

    def answered_question(self, ind, answer):
        '''
        Updates the question_list and answered_question_list to reflect the question you have answered.
        In:

        ind - takes the index of the question you are answering from the question_list

        answer - takes the answer to the question as a string
        Out: None
        '''
        self.answer_list.append((self.questions.pop(ind), answer))
