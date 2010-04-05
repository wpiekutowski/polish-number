# encoding: UTF-8

require File.join(File.expand_path(File.dirname(__FILE__)), "spec_helper")

describe :PolishNumber do
  {
    0 => 'zero',
    1 => 'jeden',
    2 => 'dwa',
    3 => 'trzy',
    30 => 'trzydzieści',
    21 => 'dwadzieścia jeden',
    45 => 'czterdzieści pięć',
    32 => 'trzydzieści dwa',
    99 => 'dziewięćdziesiąt dziewięć',
    100 => 'sto',
    101 => 'sto jeden',
    200 => 'dwieście',
    212 => 'dwieście dwanaście',
    323 => 'trzysta dwadzieścia trzy',
    440 => 'czterysta czterdzieści',
    999 => 'dziewięćset dziewięćdziesiąt dziewięć',
    1000 => 'tysiąc',
    1002 => 'tysiąc dwa',
    1011 => 'tysiąc jedenaście',
    1111 => 'tysiąc sto jedenaście',
    1222 => 'tysiąc dwieście dwadzieścia dwa'
  }.each do |number, translation|
    it "should translate #{number} to '#{translation}'" do
      PolishNumber.translate(number).should == translation
    end
  end
end

