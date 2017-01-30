# -*- encoding: utf-8 -*-
# stub: dm-core 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "dm-core".freeze
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dan Kubb".freeze]
  s.date = "2013-06-10"
  s.description = "DataMapper core library".freeze
  s.email = ["dan.kubb@gmail.com".freeze]
  s.extra_rdoc_files = ["LICENSE".freeze, "README.rdoc".freeze]
  s.files = ["LICENSE".freeze, "README.rdoc".freeze]
  s.homepage = "https://github.com/datamapper/dm-core".freeze
  s.rubygems_version = "2.6.10".freeze
  s.summary = "DataMapper core library".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.3"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0.3"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 1.3.2"])
    else
      s.add_dependency(%q<addressable>.freeze, ["~> 2.3"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0.3"])
      s.add_dependency(%q<rspec>.freeze, ["~> 1.3.2"])
    end
  else
    s.add_dependency(%q<addressable>.freeze, ["~> 2.3"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 1.3.2"])
  end
end
