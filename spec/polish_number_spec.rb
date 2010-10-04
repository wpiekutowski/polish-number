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
    1000 => 'jeden tysiąc',
    1002 => 'jeden tysiąc dwa',
    1011 => 'jeden tysiąc jedenaście',
    1111 => 'jeden tysiąc sto jedenaście',
    1222 => 'jeden tysiąc dwieście dwadzieścia dwa',
    2415 => 'dwa tysiące czterysta piętnaście',
    5000 => 'pięć tysięcy',
    10000 => 'dziesięć tysięcy',
    22141 => 'dwadzieścia dwa tysiące sto czterdzieści jeden',
    123754 => 'sto dwadzieścia trzy tysiące siedemset pięćdziesiąt cztery',
    999999 => 'dziewięćset dziewięćdziesiąt dziewięć tysięcy dziewięćset dziewięćdziesiąt dziewięć'
  }.each do |number, translation|
    it "should translate #{number} to '#{translation}'" do
      PolishNumber.translate(number).should == translation
    end
  end

  it "should raise ArgumentError when number is smaller than 0" do
    lambda { PolishNumber.translate(-1) }.should.raise(ArgumentError)
  end

  it "should raise ArgumentError when number is greater than 999999.99" do
    lambda { PolishNumber.translate(1_000_000) }.should.raise(ArgumentError)
  end

  it "should raise ArgumentError when currency is unknown" do
    lambda { PolishNumber.translate(1_000_000, :currency => :ABC) }.
      should.raise(ArgumentError)
  end
end
