class EmailValidator
  def initialize(email)
    @email = email
  end

  def is_valid?
    has_only_allowed_characters and
    has_only_one_at_symbol and
    does_not_start_or_end_with_dot and
    has_text_after_at_symbol
  end

  def has_only_allowed_characters
    return false unless @email =~ /^[a-z0-9\.@]+$/
    true
  end

  def has_only_one_at_symbol
    return false unless @email.count('@') == 1
    true
  end

  def does_not_start_or_end_with_dot
    return true unless @email.start_with?('.') or @email.end_with?('.')
    false
  end

  def has_text_after_at_symbol
    return false unless @email =~ /@[a-z0-9\.]+$/
    true
  end
end
