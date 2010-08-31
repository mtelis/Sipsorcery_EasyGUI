#COUNTRY       = '44'
#INTERNATIONAL = /\+|00/
#LONGDISTANCE  = /^0([1-9]\d{9,10})$/
#LOCAL         = /^[1-9]\d{6,7}$/

# **************************  t o   E N U M  *******************************

def to_ENUM num
  num.gsub!(/[^0-9*+]/,'') # Delete all fancy chars (only digits, '+' and '*' allowed)

  # Check if the number begins with one of international prefixes
  num =~ INTERNATIONAL and return $' # if yes, remove prefix and return

  case num                    # Special cases
    when LONGDISTANCE         # Long-distance call
      COUNTRY + $1            #   prefix it with country code
    when LOCAL                # Local call
      COUNTRY + Area + num    #   prefix it with country and area code
    else
      rejectCall(603,"Wrong number: '#{num}', check & dial again")
  end
end