# encoding: UTF-8

module PolishNumber
  TRANSLATIONS = {
    0 => 'zero',
    1 => 'jeden',
    2 => 'dwa',
    3 => 'trzy',
    4 => 'cztery',
    5 => 'pięć',
    7 => 'siedem',
    6 => 'sześć',
    8 => 'osiem',
    9 => 'dziewięć',
    10 => 'dziesięć',
    11 => 'jedenaście',
    12 => 'dwanaście',
    13 => 'trzynaście',
    14 => 'czternaście',
    15 => 'piętnaście',
    16 => 'szesnaście',
    17 => 'siedemnaście',
    18 => 'osiemnaście',
    19 => 'dziewiętnaście',
    20 => 'dwadzieścia',
    30 => 'trzydzieści',
    40 => 'czterdzieści',
    50 => 'pięćdziesiąt',
    60 => 'sześćdziesiąt',
    70 => 'siedemdziesiąt',
    80 => 'osiemdziesiąt',
    90 => 'dziewięćdziesiąt',
    100 => 'sto',
    200 => 'dwieście',
    300 => 'trzysta',
    400 => 'czterysta',
    500 => 'pięćset',
    600 => 'sześćset',
    700 => 'siedemset',
    800 => 'osiemset',
    900 => 'dziewięćset',
    1000 => 'tysiąc'
  }.freeze

  def self.rehash(hash)
    result = Hash.new(hash['5'])
    result[0] = hash['5']
    result[1] = hash['1']
    result[2] = result[3] = result[4] = hash['2_3_4']
  end

  THOUSANDS = rehash({
    '1' => 'tysiąc',
    '2_3_4' => 'tysiące', # 22..24, 32..34
    '5' => 'tysięcy', # 0, 5..21, 25..31
  })

  def self.translate_0_19(number)
    TRANSLATIONS[number]
  end

  def self.translate_20_99(number)
    return TRANSLATIONS[number] if TRANSLATIONS.has_key? number

    first, second = number.to_s.split(//).map { |c| c.to_i }
    "#{TRANSLATIONS[first*10]} #{TRANSLATIONS[second]}"
  end

  def self.translate_0_99(number)
    number < 20 ? translate_0_19(number) : translate_20_99(number)
  end

  def self.translate_100_999(number)
    return TRANSLATIONS[number] if TRANSLATIONS.has_key? number

    hundreds = number/100
    translations = []
    translations << TRANSLATIONS[hundreds*100]

    tens_units = number%100
    if tens_units > 0
      translations << translate_0_99(tens_units)
    end

    translations.join(' ')
  end

  def self.translate_0_999(number)
    number < 100 ? translate_0_99(number) : translate_100_999(number)
  end

  def self.translate_1000_9999(number)
    return TRANSLATIONS[number] if TRANSLATIONS.has_key? number

    translations = []

    thousands = number/1000
    if thousands == 1
      translations << TRANSLATIONS[1000]
    else
      translations << "#{translate_100_999(number)} #{pluralize(thousands, THOUSANDS)}"
    end

    number %= 1000
    hundreds = number/100
    translations << translate_0_999(number)

    translations.join(' ')
  end

  def self.translate(number)
    number = number.to_i
    case number
    when 0..19
      return translate_0_19(number)
    when 20..99
      return translate_20_99(number)
    when 100..999
      return translate_100_999(number)
    when 1000..9999
      return translate_1000_9999(number)
    end
  end

  def self.translate_3_digit_number(number)
    unless (0..999) === number
      raise "#{number} not supported"
    end

    # handle simple numbers
    if TRANSLATIONS.has_key? number
      return TRANSLATIONS[number]
    end

    number_digits = number.to_s.split(//)

    last_2_digits =
    if number > 99
      number_digits[-2, 2]
    else
      number_digits
    end

    last_2_digits = last_2_digits.join.to_i
    last_2_translation = TRANSLATIONS[last_2_digits]

    translation_digits = []

    if last_2_translation
      translation_digits.unshift last_2_digits
      number /= 100
      position = 2
    else
      position = 0
    end

    while number != 0
      digit = number%10
      if digit > 0
        power = 10**position
        translation_digits.unshift digit*power
      end
      number /= 10
      position += 1
    end

    translation_digits
  end
end

