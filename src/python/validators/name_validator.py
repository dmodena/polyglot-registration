import re

class NameValidator:
    def is_valid(self, name):
        namePattern = "^[A-Z][a-z]{1,}$"
        if " " in name:
            name_words = name.split(" ")
            for name_word in name_words:
                if "-" in name_word:
                    words_with_dash = name_word.split("-")
                    for word_with_dash in words_with_dash:
                        if not (re.match(namePattern, word_with_dash)):                             
                            return False
                else:
                    if not (re.match(namePattern, name_word)):          
                        return False
            return True    
        else:
            return False
        

