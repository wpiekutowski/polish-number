# encoding: UTF-8

module PolishNumber
  HUNDREDS = ['', 'sto ', 'dwieście ', 'trzysta ', 'czterysta ', 'pięćset ', 'sześćset ',
    'siedemset ', 'osiemset ', 'dziewięćset ']

  TENS = ['', 'dziesięć ', 'dwadzieścia ', 'trzydzieści ', 'czterdzieści ', 'pięćdziesiąt ',
    'sześćdziesiąt ', 'siedemdziesiąt ', 'osiemdziesiąt ', 'dziewięćdziesiąt ']

  TEENS = ['', 'jedenaście ', 'dwanaście ', 'trzynaście ', 'czternaście ', 'piętnaście ',
    'szesnaście ', 'siedemnaście ', 'osiemnaście ', 'dziewiętnaście ']

  UNITIES = ['', 'jeden ', 'dwa ', 'trzy ', 'cztery ', 'pięć ', 'sześć ', 'siedem ', 'osiem ',
    'dziewięć ']

  ZERO = 'zero'

  THOUSANDS = ['', 'tysiąc ', 'tysiące ', 'tysięcy ']

  CURRENCIES = {
    nil => nil,
    :PLN => ['złoty', 'złote', 'złotych']
  }

  def self.translate(number, options={})
    unless CURRENCIES.has_key?(options[:currency])
      raise ArgumentError, "unknown :currency option '#{options[:currency].inspect}'. Choose one from: #{CURRENCIES.inspect}"
    end

    number = number.to_i

    unless (0..999999).include? number
      raise ArgumentError, 'number should be in 0..999999 range'
    end

    return ZERO.dup if number == 0

    formatted_number = sprintf('%06.0f', number)
    digits = formatted_number.chars.map { |char| char.to_i }

    result = ''
    result << process_0_999(digits[0..2])
    result << thousands(digits[0..2])
    result << process_0_999(digits[3..5])
    result.strip!
    result
  end

  private

  def self.process_0_999(digits)
    result = ''
    result << HUNDREDS[digits[0]]

    if digits[1] == 1 && digits[2] != 0
      result << TEENS[digits[2]]
    else
      result << TENS[digits[1]]
      result << UNITIES[digits[2]]
    end

    result
  end

  def self.thousands(digits)
    if digits[0] == 0 && digits[1] == 0 && digits[2] == 0
      thousand_id = 0
    elsif digits[0] == 0 && digits[1] == 0 && digits[2] == 1
      thousand_id = 1
    elsif digits[1] != 1 && (2..4).include?(digits[2])
      thousand_id = 2
    else
      thousand_id = 3
    end
    THOUSANDS[thousand_id]
  end
end

