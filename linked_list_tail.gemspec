# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'linked_list_tail/version'

Gem::Specification.new do |spec|
  spec.name          = "linked_list_tail"
  spec.version       = LinkedListTail::VERSION
  spec.authors       = ["Chris Horton"]
  spec.email         = ["hortoncd@gmail.com"]
  spec.license       = 'Apache-2.0'

  spec.summary       = %q{Simple implementation of linked list with tail pointer}
  spec.description   = %q{Simple implementation of linked list with tail pointer.}
  spec.homepage      = "https://github.com/hortoncd/linked-list-tail-rb"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.17"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency 'simplecov', '>= 0.12.0'
end
