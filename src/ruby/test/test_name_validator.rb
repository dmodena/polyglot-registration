require "minitest/autorun"
require_relative "../app/validators/name_validator.rb"

class TestNameValidator < Minitest::Test
  def test_validates_name
    test_data = [
      { :name => "Carl Mass", :expected => true },
      { :name => "Nicole Grownman", :expected => true },
      { :name => "Jean-Paul Satire", :expected => true },
      { :name => "Sophie Ballot Hawk", :expected => true },
      { :name => "john Doe", :expected => false },
      { :name => "John Do3", :expected => false },
      { :name => "John Doe.", :expected => false },
      { :name => "John", :expected => false },
      { :name => "John   Doe", :expected => false },
      { :name => "John-al Doe", :expected => false },
      { :name => "John DoE", :expected => false }
    ]

    test_data.each do |item|
      assert_equal(item[:expected], NameValidator.new(item[:name]).is_valid?, "#{item[:name]} validation failed")
    end
  end
end
