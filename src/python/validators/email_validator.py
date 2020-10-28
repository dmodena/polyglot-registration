class EmailValidator:
    def is_valid(self, email):
        if email.count("@") != 1:
            return False

        if email[0] == "." or email[-1] == ".":
            return False

        if email[-1] == "@":
            return False

        if not email.islower():
            return False

        for c in email:
            if not (c.isalpha() or c.isdigit() or c == "." or c == "@"):
                return False

        return True

