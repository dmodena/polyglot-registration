class DocumentValidator
  def initialize(document)
    @document = document
  end

  def is_valid?
    has_only_numbers_dots_and_dashes &&
    has_correct_pattern &&
    first_digit_after_dash_valid &&
    second_digit_after_dash_valid
  end

  private

  attr_accessor :document

  def mod_ten
    # the first digit should be equals to the sum of first 9 digits mod 10
    #   - ex: for document 123.456.789-xx -> (1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9) mod 10 = 5
    nums = document.split("").select {|el| el.match(/[\d]+.*/)}
    nums.pop(2)
    ints = nums.map(&:to_i)
    ints.sum % 10
  end

  def multiply_first_three_sets_then_mod_ten
    # multiplication of the 3 sets of numbers mod 10
    #  - ex: for document 123.456.789-5x -> (123 * 456 * 789) mod 10 = 2
    first_three_sets = document.match(/([0-9]{3}\.){2}([0-9]{3})/)[0]
    array = first_three_sets.split(".")
    ints = array.map(&:to_i)
    sum = ints.inject(:*)
    modulo = sum % 10
  end

  def first_digit_after_dash
    chopped_string = document.chop
    chopped_string.match(/[0-9]$/)[0].to_i
  end

  def second_digit_after_dash
    document.match(/[0-9]$/)[0].to_i
  end


  def has_only_numbers_dots_and_dashes
    return false unless document =~ /^[0-9.-]*$/
    true
  end

  def has_correct_pattern
    return false unless document =~ /^([0-9]{3}\.){2}([0-9]{3}\-)[0-9]{2}$/
    true
  end

  def first_digit_after_dash_valid
    # the first digit after dash should be equals to the sum of first 9 digits mod 10
    return false unless first_digit_after_dash === mod_ten
    true
  end

  def second_digit_after_dash_valid
    # the second digit should be equals to the multiplication of the 3 sets of numbers mod 10
    return false unless second_digit_after_dash === multiply_first_three_sets_then_mod_ten
    true
  end

end
