from validators.document_validator import DocumentValidator
from validators.email_validator import EmailValidator
from validators.name_validator import NameValidator

def main():
    document_validator = DocumentValidator()
    email_validator = EmailValidator()
    name_validator = NameValidator()

    print("Please insert required data below.")

    is_valid = False
    while not is_valid:
        name = input("Name: ")
        is_valid = name_validator.is_valid(name)
        if is_valid: break
        print("Name is invalid.")

    is_valid = False
    while not is_valid:
        document = input("Document: ")
        is_valid = document_validator.is_valid(document)
        if is_valid: break
        print("Document is invalid.")

    is_valid = False
    while not is_valid:
        email = input("Email: ")
        is_valid = email_validator.is_valid(email)
        if is_valid: break
        print("Email is invalid.")

    print("Registration completed.")

main()
