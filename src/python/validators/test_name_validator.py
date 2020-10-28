import unittest
from name_validator import NameValidator

class TestNameValidator(unittest.TestCase):
    def test_validates_document(self):
        name_validator = NameValidator()

        test_data = [
            ("Carl Mass", True),
            ("Nicole Grownman", True),
            ("Jean-Paul Satire", True),
            ("Sophie Ballot Hawk", True),
            ("john Doe", False),
            ("John Do3", False),
            ("John Doe.", False),
            ("John", False),
            ("John   Doe", False),
            ("John-al Doe", False),
            ("John DoE", False)
        ]

        for item in test_data:
            self.assertEqual(item[1], name_validator.is_valid(item[0]))
