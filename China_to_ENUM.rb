COUNTRY = '86'

# **************************  t o   E N U M  *******************************

def to_ENUM num
  num.gsub!(/[^0-9*+]/,'') # Delete all fancy chars (only digits, '+' and '*' allowed)

  # Check if the number begins with one of international prefixes:
  #  '+' - international format
  #  00 -  international prefix in China

  num =~ /^(\+|00)/ and return $' # if yes, remove prefix and return

  case num                    # Special cases
    when /^0((10|2\d|80\d\d|\d\d\d)[2-9]\d{6,7})$/ # 0 + area + phone number
      COUNTRY + $1
    when /^1[2-9]\d{9}$/      # Mobile number
      COUNTRY + num
    when /^[2-9]\d{6,7}$/     # Local call
      COUNTRY + Area + num    # prefix it with COUNTRY and area code
    else
      rejectCall(603,"Wrong number: '#{num}', check & dial again")
  end
end