# -*- encoding: utf-8 -*-
# stub: simplecov 0.18.5 ruby lib

Gem::Specification.new do |s|
  s.name = "simplecov".freeze
  s.version = "0.18.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/colszowka/simplecov/issues", "changelog_uri" => "https://github.com/colszowka/simplecov/blob/master/CHANGELOG.md", "documentation_uri" => "https://www.rubydoc.info/gems/simplecov/0.18.5", "mailing_list_uri" => "https://groups.google.com/forum/#!forum/simplecov", "source_code_uri" => "https://github.com/colszowka/simplecov/tree/v0.18.5" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Christoph Olszowka".freeze]
  s.date = "2020-02-25"
  s.description = "Code coverage for Ruby with a powerful configuration library and automatic merging of coverage across test suites".freeze
  s.email = ["christoph at olszowka de".freeze]
  s.homepage = "https://github.com/colszowka/simplecov".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.0.9".freeze
  s.summary = "Code coverage for Ruby".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<docile>.freeze, ["~> 1.1"])
      s.add_runtime_dependency(%q<simplecov-html>.freeze, ["~> 0.11"])
    else
      s.add_dependency(%q<docile>.freeze, ["~> 1.1"])
      s.add_dependency(%q<simplecov-html>.freeze, ["~> 0.11"])
    end
  else
    s.add_dependency(%q<docile>.freeze, ["~> 1.1"])
    s.add_dependency(%q<simplecov-html>.freeze, ["~> 0.11"])
  end
end
