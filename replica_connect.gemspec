# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'replica_connect/version'

Gem::Specification.new do |gem|
  gem.name          = "replica_connect"
  gem.version       = ReplicaConnect::VERSION
  gem.authors       = ["Solomon Kahn", "Richard Boyle"]
  gem.email         = ["solomon.kahn@gmail.com"]
  gem.description   = "Connect to a database easily from a ruby file"
  gem.summary       = "Easily connect to a database in ruby scripts"
  gem.homepage      = "http://www.github.com/paperlesspost/replica_connect"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('activerecord')
end
