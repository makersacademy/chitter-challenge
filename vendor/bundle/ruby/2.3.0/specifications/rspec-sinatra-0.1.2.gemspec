# -*- encoding: utf-8 -*-
# stub: rspec-sinatra 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-sinatra".freeze
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sam Joseph".freeze]
  s.date = "2014-10-13"
  s.description = "This little gem will help you to initialize an rspec environment for a sinatra application. It will generate the required files from templates.".freeze
  s.email = "tansaku@gmail.com".freeze
  s.executables = ["rspec-sinatra".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "LICENSE".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze, "bin/rspec-sinatra".freeze]
  s.homepage = "http://github.com/tansaku/rspec-sinatra".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubyforge_project = "rspec-sinatra".freeze
  s.rubygems_version = "2.6.10".freeze
  s.summary = "Initialize an rspec environment for sinatra".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<templater>.freeze, [">= 1.0.0"])
    else
      s.add_dependency(%q<templater>.freeze, [">= 1.0.0"])
    end
  else
    s.add_dependency(%q<templater>.freeze, [">= 1.0.0"])
  end
end
