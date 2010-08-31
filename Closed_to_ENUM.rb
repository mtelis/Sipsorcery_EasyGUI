#COUNTRY       = '33'
#INTERNATIONAL = /\+|00/
#LOCAL         = /^0[1-9]\d{8}$/

# **************************  t o   E N U M  *******************************

def to_ENUM num
  num.gsub!(/[^0-9*+]/,'') # Delete all fancy chars (only digits, '+' and '*' allowed)

  # Check if the number begins with one of international prefixes
  num =~ INTERNATIONAL and return $' # if yes, remove prefix and return

  rejectCall(603,"Wrong number: '#{num}', check & dial again") unless num =~ LOCAL
  COUNTRY + num
end