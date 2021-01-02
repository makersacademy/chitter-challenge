# -*- encoding: utf-8 -*-
# stub: sinatra-flash 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sinatra-flash".freeze
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Stephen Eley".freeze]
  s.date = "2010-05-02"
  s.description = "A Sinatra extension for setting and showing Rails-like flash messages. This extension improves on the Rack::Flash gem by being simpler to use, providing a full range of hash operations (including iterating through various flash keys, testing the size of the hash, etc.), and offering a 'styled_flash' view helper to render the entire flash hash with sensible CSS classes. The downside is reduced flexibility -- these methods will *only* work in Sinatra.".freeze
  s.email = "sfeley@gmail.com".freeze
  s.extra_rdoc_files = ["LICENSE.markdown".freeze, "README.markdown".freeze]
  s.files = ["LICENSE.markdown".freeze, "README.markdown".freeze]
  s.homepage = "http://github.com/SFEley/sinatra-flash".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "3.2.4".freeze
  s.summary = "Proper flash messages in Sinatra".freeze

  s.installed_by_version = "3.2.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<sinatra>.freeze, [">= 1.0.0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 1.2.9"])
    s.add_development_dependency(%q<yard>.freeze, [">= 0"])
    s.add_development_dependency(%q<sinatra-sessionography>.freeze, [">= 0"])
  else
    s.add_dependency(%q<sinatra>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 1.2.9"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<sinatra-sessionography>.freeze, [">= 0"])
  end
end
