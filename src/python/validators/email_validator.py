import re


class EmailValidator:

    pattern = r"^[a-z0-9][a-z0-9.]*@[a-z0-9]*\.?[a-z0-9.]*[a-z0-9]$"

    def is_valid(self, email):
        """Returns True for valid email and False for invalid email

        Args:
            email (str): Email string

        Returns:
            bool: Email validity
        """

        if re.match(EmailValidator.pattern, email):
            return True
        return False
