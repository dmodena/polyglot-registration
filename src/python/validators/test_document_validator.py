import unittest
from document_validator import DocumentValidator

class TestDocumentValidator(unittest.TestCase):
    def test_validates_document(self):
        document_validator = DocumentValidator()

        test_data = [
            ("123.456.789-52", True),
            ("583.432.413-38", True),
            ("490.864.567-90", True),
            ("541.942.634-82", False),
            ("641.740.159-50", False),
            ("813.321.999-01", False),
            ("123.456.78-958", False),
            ("123.45.6.789-58", False),
            ("123-456.789-58", False),
            ("ab3.456.789-58", False),
            ("123.456.789-x?", False)
        ]

        for item in test_data:
            self.assertEqual(item[1], document_validator.is_valid(item[0]))
