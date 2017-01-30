# -*- encoding: utf-8 -*-
# stub: dm-validations 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "dm-validations".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Guy van den Berg".freeze]
  s.date = "2011-10-09"
  s.description = "Library for performing validations on DM models and pure Ruby object".freeze
  s.email = "vandenberg.guy [a] gmail [d] com".freeze
  s.extra_rdoc_files = ["LICENSE".freeze, "README.rdoc".freeze]
  s.files = ["LICENSE".freeze, "README.rdoc".freeze]
  s.homepage = "http://github.com/datamapper/dm-validations".freeze
  s.rubyforge_project = "datamapper".freeze
  s.rubygems_version = "2.6.10".freeze
  s.summary = "Library for performing validations on DM models and pure Ruby object".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>.freeze, ["~> 1.2.0"])
      s.add_development_dependency(%q<dm-types>.freeze, ["~> 1.2.0"])
      s.add_development_dependency(%q<jeweler>.freeze, ["~> 1.6.4"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 0.9.2"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 1.3.2"])
    else
      s.add_dependency(%q<dm-core>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<dm-types>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<jeweler>.freeze, ["~> 1.6.4"])
      s.add_dependency(%q<rake>.freeze, ["~> 0.9.2"])
      s.add_dependency(%q<rspec>.freeze, ["~> 1.3.2"])
    end
  else
    s.add_dependency(%q<dm-core>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<dm-types>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<jeweler>.freeze, ["~> 1.6.4"])
    s.add_dependency(%q<rake>.freeze, ["~> 0.9.2"])
    s.add_dependency(%q<rspec>.freeze, ["~> 1.3.2"])
  end
end
