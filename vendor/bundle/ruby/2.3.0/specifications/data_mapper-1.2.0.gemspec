# -*- encoding: utf-8 -*-
# stub: data_mapper 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "data_mapper".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dan Kubb".freeze]
  s.date = "2011-10-13"
  s.description = "Faster, Better, Simpler.".freeze
  s.email = ["dan.kubb@gmail.com".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze]
  s.files = ["History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze]
  s.homepage = "http://datamapper.org".freeze
  s.rdoc_options = ["--main".freeze, "README.txt".freeze]
  s.rubyforge_project = "datamapper".freeze
  s.rubygems_version = "2.6.10".freeze
  s.summary = "An Object/Relational Mapper for Ruby".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>.freeze, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<dm-aggregates>.freeze, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<dm-constraints>.freeze, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<dm-migrations>.freeze, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<dm-transactions>.freeze, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<dm-serializer>.freeze, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<dm-timestamps>.freeze, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<dm-validations>.freeze, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<dm-types>.freeze, ["~> 1.2.0"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 2.12"])
    else
      s.add_dependency(%q<dm-core>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<dm-aggregates>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<dm-constraints>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<dm-migrations>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<dm-transactions>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<dm-serializer>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<dm-timestamps>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<dm-validations>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<dm-types>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<hoe>.freeze, ["~> 2.12"])
    end
  else
    s.add_dependency(%q<dm-core>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<dm-aggregates>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<dm-constraints>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<dm-migrations>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<dm-transactions>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<dm-serializer>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<dm-timestamps>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<dm-validations>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<dm-types>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<hoe>.freeze, ["~> 2.12"])
  end
end
