# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dot_grid/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Scott LaBounty"]
  gem.email         = ["slabounty@gmail.com"]
  gem.description   = %q{Dot Grid planner PDF generator.}
  gem.summary       = %q{Dot Grid planner PDF generator.}
  gem.homepage      = "http://github.com/slabounty/dot_grid"
  gem.licenses      = %w[MIT]

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dot_grid"
  gem.require_paths = ["lib"]
  gem.version       = DotGrid::VERSION

  gem.add_development_dependency "pry", '~> 0.10'
  gem.add_development_dependency "rspec", '~> 3.0.0'
  gem.add_development_dependency "rspec-collection_matchers", '~> 1.0.0'
  gem.add_development_dependency "rake", '~> 10.3.2'
  gem.add_development_dependency "coveralls", '~> 0.7.1'
  gem.add_dependency "prawn", '~> 1.3.0'
  gem.add_dependency "trollop", '~> 2.0'
end
