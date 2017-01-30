# -*- encoding: utf-8 -*-
# stub: dm-types 1.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "dm-types".freeze
  s.version = "1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dan Kubb".freeze]
  s.date = "2012-08-02"
  s.description = "DataMapper plugin providing extra data types".freeze
  s.email = ["dan.kubb@gmail.com".freeze]
  s.extra_rdoc_files = ["LICENSE".freeze, "README.rdoc".freeze]
  s.files = ["LICENSE".freeze, "README.rdoc".freeze]
  s.homepage = "http://datamapper.org".freeze
  s.rubygems_version = "2.6.10".freeze
  s.summary = "DataMapper plugin providing extra data types".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bcrypt-ruby>.freeze, ["~> 3.0"])
      s.add_runtime_dependency(%q<fastercsv>.freeze, ["~> 1.5"])
      s.add_runtime_dependency(%q<multi_json>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<json>.freeze, ["~> 1.6"])
      s.add_runtime_dependency(%q<stringex>.freeze, ["~> 1.4"])
      s.add_runtime_dependency(%q<uuidtools>.freeze, ["~> 2.1"])
      s.add_runtime_dependency(%q<dm-core>.freeze, ["~> 1.2.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 1.3"])
    else
      s.add_dependency(%q<bcrypt-ruby>.freeze, ["~> 3.0"])
      s.add_dependency(%q<fastercsv>.freeze, ["~> 1.5"])
      s.add_dependency(%q<multi_json>.freeze, ["~> 1.0"])
      s.add_dependency(%q<json>.freeze, ["~> 1.6"])
      s.add_dependency(%q<stringex>.freeze, ["~> 1.4"])
      s.add_dependency(%q<uuidtools>.freeze, ["~> 2.1"])
      s.add_dependency(%q<dm-core>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 0.9"])
      s.add_dependency(%q<rspec>.freeze, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<bcrypt-ruby>.freeze, ["~> 3.0"])
    s.add_dependency(%q<fastercsv>.freeze, ["~> 1.5"])
    s.add_dependency(%q<multi_json>.freeze, ["~> 1.0"])
    s.add_dependency(%q<json>.freeze, ["~> 1.6"])
    s.add_dependency(%q<stringex>.freeze, ["~> 1.4"])
    s.add_dependency(%q<uuidtools>.freeze, ["~> 2.1"])
    s.add_dependency(%q<dm-core>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 0.9"])
    s.add_dependency(%q<rspec>.freeze, ["~> 1.3"])
  end
end
