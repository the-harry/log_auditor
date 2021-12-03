# frozen_string_literal: true

require_relative "lib/log_auditor/version"

Gem::Specification.new do |spec|
  spec.name = "log_auditor"
  spec.version = LogAuditor::VERSION
  spec.authors = ["the-harry"]
  spec.email = ["matheusthebr@gmail.com"]

  spec.summary = "Simple log parser for ip and routes."
  spec.description = "Simple log parser for ip and routes."
  spec.homepage = "https://github.com/the-harry/log_auditor"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.2"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/the-harry/log_auditor"
  spec.metadata["changelog_uri"] = "https://github.com/the-harry/log_auditor/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
