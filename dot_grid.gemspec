# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dot_grid/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Scott LaBounty"]
  gem.email         = ["slabounty@gmail.com"]
  gem.description   = %q{Dot Grid planner PDF generator.}
  gem.summary       = %q{Dot Grid planner PDF generator.}
  gem.homepage      = "http://github.com/slabounty/dot_grid"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dot_grid"
  gem.require_paths = ["lib"]
  gem.version       = DotGrid::VERSION

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
  gem.add_dependency "prawn"
  gem.add_dependency "trollop"
  gem.add_dependency "require_all"
end
