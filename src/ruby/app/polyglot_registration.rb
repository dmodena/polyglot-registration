require_relative './validators/document_validator.rb'
require_relative './validators/email_validator.rb'
require_relative './validators/name_validator.rb'

def main
  document_validator = DocumentValidator.new
  email_validator = EmailValidator.new

  puts "Please insert required data below."

  loop do
    print "Name: "
    name = gets.chomp

    break if NameValidator.new(name).is_valid?
    puts "Name is invalid."
  end

  loop do
    print "Document: "
    document = gets.chomp

    break if document_validator.is_valid? document
    puts "Document is invalid."
  end

  loop do
    print "Email: "
    email = gets.chomp

    break if email_validator.is_valid? email
    puts "Email is invalid."
  end

  puts "Registration completed."

end

main
