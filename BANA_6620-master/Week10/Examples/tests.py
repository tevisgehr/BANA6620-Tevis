import unittest as unittest
import my_functions as a


class TestAssessment1(unittest.TestCase):

    def test_count_characters1(self):
        string = "abafdcggfaabe"
        answer = {"a": 4, "b": 2, "c": 1, "d": 1, "e": 1, "f": 2, "g": 2}
        result = a.count_characters(string)
        self.assertEqual(result, answer)

    def test_count_characters2(self):
        string = "AbafdcgGfaAbE"
        answer = {"a": 4, "b": 2, "c": 1, "d": 1, "e": 1, "f": 2, "g": 2}
        result = a.count_characters(string)
        self.assertEqual(result, answer)

    def test_count_characters3(self):
        string = "Aba5fd cgGfa-Ab/E"
        answer = {"a": 4, "b": 2, "c": 1, "d": 1, "e": 1, "f": 2, "g": 2}
        result = a.count_characters(string)
        self.assertEqual(result, answer)

    def test_count_characters4(self):
        string = 42
        answer = 'input not string'
        result = a.count_characters(string)
        self.assertEqual(result, answer)


    def test_word_count1(self):
        self.assertEqual(a.word_count('data/alice.txt'), (1615, 8461))

    def test_word_count2(self):
        self.assertEqual(a.word_count('test_text.txt'), (16, 76))

if __name__ == '__main__':
    unittest.main()
