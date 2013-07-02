# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'question_fetcher/version'

Gem::Specification.new do |spec|
  spec.name          = "question_fetcher"
  spec.version       = Question::Fetcher::VERSION
  spec.authors       = ["Jennifer Eliuk"]
  spec.email         = ["jen7maples@gmail.com"]
  spec.description   = %q{Question fetcher for Backchannel app}
  spec.summary       = %q{Serves questions and their votes for conference chats}
  spec.homepage      = "https://github.com/7maples/question-fetcher"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
