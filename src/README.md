Source Code
===

This is a simple console app that simulates registering a person. A screenshot follows below:

![success run](https://github.com/dmodena/polyglot-registration/blob/main/src/success_run.png)

When the user enters their data, there is validation for each input. In case the validation fails, a message is displayed:

![invalid data](https://github.com/dmodena/polyglot-registration/blob/main/src/invalid_data.png)

**Note:** these validations may need to be implemented.

## Validations
Below are the rules for each validation.

### Validating Name
    - name should have only letters or dashes
    - it should have 2 or more words, for full name
    - there should be a single space between each word
    - each word should start with a capital letter
    - first letter after dash should also be a capital letter
    - all other letters should be lower case

### Validating Document
- document should have only numbers, dots and dashes
- it should have the following pattern: xxx.xxx.xxx-xx where x is a digit (0-9)
- the numbers after the dash are used for additional validation, with the following rules:
    - the first digit should be equals to the sum of first 9 digits mod 10
        - ex: for document 123.456.789-xx -> (1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9) mod 10 = 5  
          therefore first digit after dash is 5 -> 123.456.789-5x
    - the second digit should be equals to the multiplication of the 3 sets of numbers mod 10
        - ex: for document 123.456.789-5x -> (123 * 456 * 789) mod 10 = 2  
          therefore second digit after dash is 2 -> 123.456.789-52

### Validating Email
    - email should only have letters, numbers, dots and '@' symbol
    - all letters should be lower case
    - there should be only one '@' symbol, which is mandatory
    - email cannot start or end with a dot
    - there should be text after '@' symbol
    - no other validations are necessary
