class PhoneNumber
  def initialize(phone_number)
    @phone_number = phone_number
  end

  def number
    return '0' * 10 if contains_letters?
    if clean_number.length == 10
      clean_number
    elsif valid_prefix?
      clean_number[1..-1]
    else
      '0' * 10
    end
  end

  def contains_letters?
    /[a-z]/ === @phone_number
  end

  def valid_prefix?
    clean_number.length == 11 && clean_number[0] == "1"
  end

  def clean_number
    @clean_number ||= @phone_number.gsub(/[^\d]/, '')
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..-1]}"
  end
end
