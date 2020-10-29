require_relative './validators/document_validator.rb'
require_relative './validators/email_validator.rb'
require_relative './validators/name_validator.rb'

def main
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

    break if DocumentValidator.new(document).is_valid?
    puts "Document is invalid."
  end

  loop do
    print "Email: "
    email = gets.chomp

    break if EmailValidator.new(email).is_valid?
    puts "Email is invalid."
  end

  puts "Registration completed."

end

main
