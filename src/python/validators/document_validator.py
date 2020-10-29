import re
class DocumentValidator:
    def is_valid(self, document):
        document_pattern = re.search("\d{3}\.\d{3}\.\d{3}-\d{2}", document)

        if not document_pattern:
            return False

        value = 0
        for i in range(len(document)-3):
            if document[i] != ".":
                value+=int(document[i])

        value = value % 10
        if value != int(document[-2]):
            return False

        value = 0
        subval0 = 0
        subval1 = 0
        subval2 = 0

        for i in range(3):
            if document[i] != ".":
                subval0 += int(document[i])*10**(2-i)
                subval1 += int(document[i+4])*10**(2-i)
                subval2 += int(document[i+8])*10**(2-i)

        value = (subval0 * subval1 * subval2) % 10
        if value != int(document[-1]):
            return False
        
        return True
