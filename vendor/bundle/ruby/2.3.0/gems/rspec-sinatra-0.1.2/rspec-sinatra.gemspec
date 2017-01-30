Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  ## Leave these as is they will be modified for you by the rake gemspec task.
  ## If your rubyforge_project name is different, then edit it and comment out
  ## the sub! line in the Rakefile
  s.name              = 'rspec-sinatra'
  s.version           = '0.1.2'
  s.date              = '2014-10-13'
  s.rubyforge_project = 'rspec-sinatra'

  s.summary     = "Initialize an rspec environment for sinatra"
  s.description = "This little gem will help you to initialize an rspec environment for a sinatra application. It will generate the required files from templates."

  s.authors  = ["Sam Joseph"]
  s.email    = 'tansaku@gmail.com'
  s.homepage = 'http://github.com/tansaku/rspec-sinatra'

  ## This gets added to the $LOAD_PATH so that 'lib/NAME.rb' can be required as
  ## require 'NAME.rb' or'/lib/NAME/file.rb' can be as require 'NAME/file.rb'
  s.require_paths = %w[lib]

  s.executables = ["rspec-sinatra"]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE]

  s.add_dependency('templater', [">= 1.0.0"])

  # = MANIFEST =
  s.files = %w[
    CHANGES.md
    LICENSE
    README.md
    Rakefile
    bin/rspec-sinatra
    rspec-sinatra.gemspec
    lib/rspec/sinatra.rb
    lib/rspec/sinatra/generators.rb
    lib/rspec/sinatra/templates/app.rbt
    lib/rspec/sinatra/templates/config.ru
    lib/rspec/sinatra/templates/spec/spec_helper.rbt
  ]
  # = MANIFEST =

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  #s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
