# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-maml/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["hasclass"]
  gem.email         = ["info@hasclass.com"]
  gem.description   = "Rubymotion helpers for building UI elements with support for pixate styleId and styleClass attributes"
  gem.summary       = "Rubymotion helpers for building UI elements with support for pixate styleId and styleClass attributes"
  gem.homepage      = "http://github.com/hasclass/motion-maml"

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "motion-maml"
  gem.require_paths = ["lib"]
  gem.version       = Maml::VERSION

  gem.add_dependency "motion-require"
end