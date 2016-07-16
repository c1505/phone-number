class PhoneNumber
  def initialize(dirty_number)
    @dirty_number = dirty_number
  end

  def number
    return '0000000000' if /[a-z]/ === @dirty_number
    if clean_number.length == 10
      clean_number
    elsif clean_number.length == 11 && valid_prefix?
      clean_number[1..-1]
    else
      '0000000000'
    end
  end

  def valid_prefix?
    clean_number[0] == "1"
  end

  def clean_number
    @clean_number ||= @dirty_number.gsub(/[^\d]/, '')
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..-1]}"
  end
end
