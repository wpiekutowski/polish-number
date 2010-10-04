def silently(&block)
  warn_level = $VERBOSE
  $VERBOSE = nil
  result = block.call
  $VERBOSE = warn_level
  result
end

require 'polish_number'

silently do
  require 'rubygems'
  gem 'test-unit'
  require 'test/spec'
end

require 'pp'
