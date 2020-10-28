class NameValidator
  def initialize(name)
    @name = name
  end

  def is_valid?
    has_only_letters_or_dashes &&
    has_more_than_two_words &&
    has_only_one_space_between_words &&
    has_capitalized_words &&
    has_first_letter_after_dash_capitalized &&
    has_only_first_letter_capitalized
  end

  private

  attr_accessor :name

  def splitted_name
    name.split(' ')
  end

  def has_only_letters_or_dashes
    return false unless name =~ /\A[a-z\s\-]*\Z/i
    true
  end

  def has_more_than_two_words
    splitted_name.size >= 2
  end

  def has_capitalized_words
    splitted_name.each do |name|
      return false unless name[0] =~ /[[:upper:]]/
    end
    true
  end

  def has_only_one_space_between_words
    return false if name =~ /\s{2,}/
    true
  end

  def has_first_letter_after_dash_capitalized
    return false if name =~ /\-[a-z]/
    true
  end

  def has_only_first_letter_capitalized
    splitted_name.each do |name|
      return false unless name[1..-1] =~ /\A[a-z]*(\-|\z)/
    end
    true
  end
end
