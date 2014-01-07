# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'react-jsx-sprockets/version'

Gem::Specification.new do |gem|
  gem.authors       = ["Jesse Stuart"]
  gem.email         = ["jesse@jessestuart.ca"]
  gem.description   = %q{Use compiled React JSX files with Sprockets}
  gem.summary       = %q{Use compiled React JSX files with Sprockets}
  gem.homepage      = "https://github.com/jvatic/react-jsx-sprockets"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "react-jsx-sprockets"
  gem.require_paths = ["lib"]
  gem.version       = ReactJSXSprockets::VERSION

  gem.add_runtime_dependency "execjs", ">= 1.2.9"
  gem.add_runtime_dependency "tilt", ">= 1.3.3"
  gem.add_runtime_dependency "sprockets", ">= 2.0.3"
  gem.add_runtime_dependency "yajl-ruby"
end
