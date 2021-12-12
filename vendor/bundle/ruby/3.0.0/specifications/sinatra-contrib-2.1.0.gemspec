# -*- encoding: utf-8 -*-
# stub: sinatra-contrib 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sinatra-contrib".freeze
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "documentation_uri" => "https://www.rubydoc.info/gems/sinatra-contrib", "homepage_uri" => "http://sinatrarb.com/contrib/", "source_code_uri" => "https://github.com/sinatra/sinatra/tree/master/sinatra-contrib" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["https://github.com/sinatra/sinatra/graphs/contributors".freeze]
  s.date = "2020-09-04"
  s.description = "Collection of useful Sinatra extensions".freeze
  s.email = "sinatrarb@googlegroups.com".freeze
  s.homepage = "http://sinatrarb.com/contrib/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.2.22".freeze
  s.summary = "Collection of useful Sinatra extensions".freeze

  s.installed_by_version = "3.2.22" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<sinatra>.freeze, ["= 2.1.0"])
    s.add_runtime_dependency(%q<mustermann>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<tilt>.freeze, ["~> 2.0"])
    s.add_runtime_dependency(%q<rack-protection>.freeze, ["= 2.1.0"])
    s.add_runtime_dependency(%q<multi_json>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_development_dependency(%q<haml>.freeze, [">= 0"])
    s.add_development_dependency(%q<erubi>.freeze, [">= 0"])
    s.add_development_dependency(%q<erubis>.freeze, [">= 0"])
    s.add_development_dependency(%q<slim>.freeze, [">= 0"])
    s.add_development_dependency(%q<less>.freeze, [">= 0"])
    s.add_development_dependency(%q<sass>.freeze, [">= 0"])
    s.add_development_dependency(%q<builder>.freeze, [">= 0"])
    s.add_development_dependency(%q<liquid>.freeze, [">= 0"])
    s.add_development_dependency(%q<redcarpet>.freeze, [">= 0"])
    s.add_development_dependency(%q<RedCloth>.freeze, ["~> 4.2.9"])
    s.add_development_dependency(%q<asciidoctor>.freeze, [">= 0"])
    s.add_development_dependency(%q<radius>.freeze, [">= 0"])
    s.add_development_dependency(%q<coffee-script>.freeze, [">= 0"])
    s.add_development_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_development_dependency(%q<creole>.freeze, [">= 0"])
    s.add_development_dependency(%q<wikicloth>.freeze, [">= 0"])
    s.add_development_dependency(%q<markaby>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, ["< 11"])
    s.add_development_dependency(%q<rack-test>.freeze, [">= 0"])
  else
    s.add_dependency(%q<sinatra>.freeze, ["= 2.1.0"])
    s.add_dependency(%q<mustermann>.freeze, ["~> 1.0"])
    s.add_dependency(%q<tilt>.freeze, ["~> 2.0"])
    s.add_dependency(%q<rack-protection>.freeze, ["= 2.1.0"])
    s.add_dependency(%q<multi_json>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_dependency(%q<haml>.freeze, [">= 0"])
    s.add_dependency(%q<erubi>.freeze, [">= 0"])
    s.add_dependency(%q<erubis>.freeze, [">= 0"])
    s.add_dependency(%q<slim>.freeze, [">= 0"])
    s.add_dependency(%q<less>.freeze, [">= 0"])
    s.add_dependency(%q<sass>.freeze, [">= 0"])
    s.add_dependency(%q<builder>.freeze, [">= 0"])
    s.add_dependency(%q<liquid>.freeze, [">= 0"])
    s.add_dependency(%q<redcarpet>.freeze, [">= 0"])
    s.add_dependency(%q<RedCloth>.freeze, ["~> 4.2.9"])
    s.add_dependency(%q<asciidoctor>.freeze, [">= 0"])
    s.add_dependency(%q<radius>.freeze, [">= 0"])
    s.add_dependency(%q<coffee-script>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<creole>.freeze, [">= 0"])
    s.add_dependency(%q<wikicloth>.freeze, [">= 0"])
    s.add_dependency(%q<markaby>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["< 11"])
    s.add_dependency(%q<rack-test>.freeze, [">= 0"])
  end
end
