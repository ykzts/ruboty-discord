lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'ruboty/discord/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-discord'
  spec.version       = Ruboty::Discord::VERSION
  spec.authors       = ['Yamagishi Kazutoshi']
  spec.email         = ['ykzts@desire.sh']
  spec.summary       = 'Discord adapter for Ruboty.'
  spec.homepage      = 'https://github.com/ykzts/ruboty-discord'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ['lib']
  spec.add_dependency 'ruboty', '>= 1.0.4'
  spec.add_dependency 'discordrb', '~> 3.2'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'bundler', '~> 1.6'
end
