# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blocker/version'

Gem::Specification.new do |spec|
  spec.name          = "blocker"
  spec.version       = Blocker::VERSION
  spec.authors       = ["Vlad Bokov"]
  spec.email         = ["razum2um@mail.ru"]
  spec.summary       = %q{Show me what blocks you!}
  spec.description   = %q{And let the gem authors about it}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "octokit"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "3.0.0.beta1"
  spec.add_development_dependency "pry-plus"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "fuubar"
  spec.add_development_dependency "pry-stack_explorer"
end
