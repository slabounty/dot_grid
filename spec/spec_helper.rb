require 'coveralls'
Coveralls.wear!

require 'rspec/collection_matchers'

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '../lib')
require 'dot_grid'

RSpec.configure do |c|
  # May need some code in here ...
end
