import unittest
from email_validator import EmailValidator

class TestEmailValidator(unittest.TestCase):
    def test_validates_document(self):
        email_validator = EmailValidator()

        test_data = [
            ("person@example.com", True),
            ("person@co", True),
            ("name.lastname@example.com", True),
            ("person2@test.org", True),
            ("Person@Example.com", False),
            ("person+3@example.com", False),
            ("pe@rson@example.com", False),
            (".person@example.com", False),
            ("person@example.com.", False),
            ("person@", False)
        ]

        for item in test_data:
            self.assertEqual(item[1], email_validator.is_valid(item[0]))
