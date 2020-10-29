require "minitest/autorun"
require_relative "../app/validators/email_validator.rb"

class TestEmailValidator < Minitest::Test
  def test_validates_email
    test_data = [
      { :email => "person@example.com", :expected => true },
      { :email => "person@co", :expected => true },
      { :email => "name.lastname@example.com", :expected => true },
      { :email => "person2@test.org", :expected => true },
      { :email => "Person@Example.com", :expected => false },
      { :email => "person+3@example.com", :expected => false },
      { :email => "pe@rson@example.com", :expected => false },
      { :email => ".person@example.com", :expected => false },
      { :email => "person@example.com.", :expected => false },
      { :email => "person@", :expected => false }
    ]

    test_data.each do |item|
      assert_equal(item[:expected], EmailValidator.new(item[:email]).is_valid?, "#{item[:email]} validation failed")
    end
  end
end
