# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'replica_connect/version'

Gem::Specification.new do |gem|
  gem.name          = "replica_connect"
  gem.version       = ReplicaConnect::VERSION
  gem.authors       = ["Solomon"]
  gem.email         = ["solomon.kahn@gmail.com"]
  gem.description   = "Connect to the pp replica"
  gem.summary       = "connect to the pp replica"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
