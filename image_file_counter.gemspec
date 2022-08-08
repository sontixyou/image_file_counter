# frozen_string_literal: true

require_relative "lib/image_file_counter/version"

Gem::Specification.new do |spec|
  spec.name = "image_file_counter"
  spec.version = ImageFileCounter::VERSION
  spec.authors = ["kenken"]
  spec.email = ["angelbeatsviolin@gmail.com"]

  spec.summary = "image file counter in directory"
  spec.description = "one command can count image files"
  spec.homepage = "https://github.com/sontixyou/image-file-counter"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "this is writting"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://test.com"
  spec.metadata["changelog_uri"] = "https://test.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "thor"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
