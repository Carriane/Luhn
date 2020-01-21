require 'minitest/autorun'

module Luhn
  # Step 1 - break the credit card into its individual digits.
  # Step 2 - Start from the right, double every second digit (i.e., digit 2, 4, 6 etc.).
  # Step 3 - If the doubled value is greater than or equal to 10, take the value and subtract 9 from it.
  # Step 4 - Sum the digits.
  # Step 5 - If the sum is divisible by 10, it's a valid number. Otherwise it's invalid.

  def self.is_valid?(number)
      new_number = number.to_s.split("").reverse
      answer =[]
      new_number.each_with_index do |num, idx|
        if idx.even?
          answer << num.to_i * 2
        else
          answer << num.to_i
        end
      end

       answer.map do |f|
        if f >= 10
          f - 9
        end   
       end
      
      sum = answer.inject(:+)

      return sum % 10 == 0

  end
end
 
class TestLuhn < MiniTest::Unit::TestCase

  def test_luhn_valid
    assert Luhn.is_valid?(4194560385008504)
  end

  def test_luhn_invalid
    assert ! Luhn.is_valid?(4194560385008505)
  end
end