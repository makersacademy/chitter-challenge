# -*- encoding: utf-8 -*-
# stub: templater 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "templater".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jonas Nicklas".freeze]
  s.date = "2009-08-27"
  s.description = "Templater has the ability to both copy files from A to B and also to render templates using ERB. Templater consists of four parts:\n\n- Actions (File copying routines, templates generation and directories creation routines).\n- Generators (set of rules).\n- Manifolds (generator suites).\n- The command line interface.\n\nHierarchy is pretty simple: manifold has one or many public and private generators. Public ones are supposed to be called\nby end user. Generators have one or more action that specify what they do, where they take files, how they name resulting\nfiles and so forth.".freeze
  s.email = ["jonas.nicklas@gmail.com".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "Manifest.txt".freeze]
  s.files = ["History.txt".freeze, "Manifest.txt".freeze]
  s.homepage = "http://github.com/jnicklas/templater".freeze
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.rubyforge_project = "templater".freeze
  s.rubygems_version = "2.6.10".freeze
  s.summary = "Templater has the ability to both copy files from A to B and also to render templates using ERB".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<highline>.freeze, [">= 1.4.0"])
      s.add_runtime_dependency(%q<diff-lcs>.freeze, [">= 1.1.2"])
      s.add_runtime_dependency(%q<extlib>.freeze, [">= 0.9.5"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 1.2.8"])
      s.add_development_dependency(%q<hoe>.freeze, [">= 2.3.3"])
    else
      s.add_dependency(%q<highline>.freeze, [">= 1.4.0"])
      s.add_dependency(%q<diff-lcs>.freeze, [">= 1.1.2"])
      s.add_dependency(%q<extlib>.freeze, [">= 0.9.5"])
      s.add_dependency(%q<rspec>.freeze, [">= 1.2.8"])
      s.add_dependency(%q<hoe>.freeze, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<highline>.freeze, [">= 1.4.0"])
    s.add_dependency(%q<diff-lcs>.freeze, [">= 1.1.2"])
    s.add_dependency(%q<extlib>.freeze, [">= 0.9.5"])
    s.add_dependency(%q<rspec>.freeze, [">= 1.2.8"])
    s.add_dependency(%q<hoe>.freeze, [">= 2.3.3"])
  end
end
