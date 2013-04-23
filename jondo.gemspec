# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jondo/version'

Gem::Specification.new do |gem|
  gem.name          = "jondo"
  gem.version       = Jondo::VERSION
  gem.authors       = ["Jason Dinsmore"]
  gem.email         = ["jason@xhatch.com"]
  gem.description   = %q{A simple clinet for the JONDO fulfillment API}
  gem.summary       = %q{A simple clinet for the JONDO fulfillment API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
