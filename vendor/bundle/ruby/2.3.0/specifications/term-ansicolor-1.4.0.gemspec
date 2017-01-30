# -*- encoding: utf-8 -*-
# stub: term-ansicolor 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "term-ansicolor".freeze
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Florian Frank".freeze]
  s.date = "2016-09-27"
  s.description = "This library uses ANSI escape sequences to control the attributes of terminal output".freeze
  s.email = "flori@ping.de".freeze
  s.executables = ["term_cdiff".freeze, "term_colortab".freeze, "term_decolor".freeze, "term_display".freeze, "term_mandel".freeze]
  s.extra_rdoc_files = ["README.rdoc".freeze, "lib/term/ansicolor.rb".freeze, "lib/term/ansicolor/attribute.rb".freeze, "lib/term/ansicolor/attribute/color256.rb".freeze, "lib/term/ansicolor/attribute/color8.rb".freeze, "lib/term/ansicolor/attribute/intense_color8.rb".freeze, "lib/term/ansicolor/attribute/text.rb".freeze, "lib/term/ansicolor/ppm_reader.rb".freeze, "lib/term/ansicolor/rgb_color_metrics.rb".freeze, "lib/term/ansicolor/rgb_triple.rb".freeze, "lib/term/ansicolor/version.rb".freeze]
  s.files = ["README.rdoc".freeze, "bin/term_cdiff".freeze, "bin/term_colortab".freeze, "bin/term_decolor".freeze, "bin/term_display".freeze, "bin/term_mandel".freeze, "lib/term/ansicolor.rb".freeze, "lib/term/ansicolor/attribute.rb".freeze, "lib/term/ansicolor/attribute/color256.rb".freeze, "lib/term/ansicolor/attribute/color8.rb".freeze, "lib/term/ansicolor/attribute/intense_color8.rb".freeze, "lib/term/ansicolor/attribute/text.rb".freeze, "lib/term/ansicolor/ppm_reader.rb".freeze, "lib/term/ansicolor/rgb_color_metrics.rb".freeze, "lib/term/ansicolor/rgb_triple.rb".freeze, "lib/term/ansicolor/version.rb".freeze]
  s.homepage = "http://flori.github.com/term-ansicolor".freeze
  s.licenses = ["GPL-2".freeze]
  s.rdoc_options = ["--title".freeze, "Term-ansicolor - Ruby library that colors strings using ANSI escape sequences".freeze, "--main".freeze, "README.rdoc".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "2.6.10".freeze
  s.summary = "Ruby library that colors strings using ANSI escape sequences".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<gem_hadar>.freeze, ["~> 1.8.0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest_tu_shim>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<tins>.freeze, ["~> 1.0"])
    else
      s.add_dependency(%q<gem_hadar>.freeze, ["~> 1.8.0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<minitest_tu_shim>.freeze, [">= 0"])
      s.add_dependency(%q<tins>.freeze, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<gem_hadar>.freeze, ["~> 1.8.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<minitest_tu_shim>.freeze, [">= 0"])
    s.add_dependency(%q<tins>.freeze, ["~> 1.0"])
  end
end
