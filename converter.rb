class Converter
  DECIMAL_ROMAN = [
    [1000, "M"],
    [900, "CM"],
    [500,  "D"],
    [400, "CD"],
    [100,  "C"],
    [90,  "XC"],
    [50,   "L"],
    [40,  "XL"],
    [10,   "X"],
    [9,   "IX"],
    [5,    "V"],
    [4,   "IV"],
    [1,    "I"]
  ]

  def decimal_to_roman(decimal)
    n, result = decimal, ""

    DECIMAL_ROMAN.each do |value, roman|
      while n >= value
        result << roman
        n -= value
      end
    end

    result
  end

  ROMAN_VALUES = {
    "M"  => 1000,
    "CM" => 900,
    "D"  => 500,
    "CD" => 400,
    "C"  => 100,
    "XC" => 90,
    "L"  => 50,
    "XL" => 40,
    "X"  => 10,
    "IX" => 9,
    "V"  => 5,
    "IV" => 4,
    "I"  => 1
  }

  def roman_to_decimal(roman)
    result = 0
    romans = roman.split("")

    while !romans.empty?
      first, second = romans

      if value_of(first) >= value_of(second)
        result += value_of(first)
      else
        result += value_of(second) - value_of(first)
        romans.shift
      end

      romans.shift
    end

    result
  end

  def value_of(roman)
    ROMAN_VALUES.fetch(roman) { 0 }
  end
end
