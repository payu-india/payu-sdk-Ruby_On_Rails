
lib = File.expand_path('lib', Dir.pwd)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'payu/constants'

Gem::Specification.new do |s| 
  s.name        = 'payu-sdk'
  s.version     = PayU::VERSION
  s.summary     = "Payu's Ruby API"
  s.authors     = ['']
  s.email       = ['dx@payu.in']
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'https://payu.in'
  s.license     = 'MIT'
  s.description = 'Official Ruby SDK for PayU'
  s.require_paths = ['lib']
end
