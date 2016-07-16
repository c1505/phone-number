class PhoneNumber
  def initialize(dirty_number)
    @dirty_number = dirty_number
  end

  def number
    # /\d/.match(@dirty_number)
    # use regex to return only digits
    return '0000000000' if /[a-z]/ === @dirty_number
    result = @dirty_number.gsub(/[^\d]/, '')
    if result.length == 10
      result
    elsif result.length == 11
      if result[0] == "1"
        result[1..-1]
      else
        '0000000000'
      end
    else
      '0000000000'
    end
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..-1]}"
  end
end