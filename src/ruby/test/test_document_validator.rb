require "minitest/autorun"
require_relative "../app/validators/document_validator.rb"

class TestDocumentValidator < Minitest::Test
  def setup
    @document_validator = DocumentValidator.new
  end

  def test_validates_document
    test_data = [
      { :document => "123.456.789-52", :expected => true },
      { :document => "583.432.413-38", :expected => true },
      { :document => "490.864.567-90", :expected => true },
      { :document => "541.942.634-82", :expected => false },
      { :document => "641.740.159-50", :expected => false },
      { :document => "813.321.999-01", :expected => false },
      { :document => "123.456.78-958", :expected => false },
      { :document => "123.45.6.789-58", :expected => false },
      { :document => "123-456.789-58", :expected => false },
      { :document => "ab3.456.789-58", :expected => false },
      { :document => "123.456.789-x?", :expected => false }
    ]

    test_data.each do |item|
      assert_equal(item[:expected], @document_validator.is_valid?(item[:document]))
    end
  end
end
