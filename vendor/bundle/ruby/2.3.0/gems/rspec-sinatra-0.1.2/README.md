rspec-sinatra
================

# Description

This little gem will help you to initialize a rspec environment for a sinatra
application. It will generate the required files from templates.

For now it's generating a `spec_helper.rb` that is using [capybara](http://github.com/jnicklas/capybara). More options might be added later. 

The entire concept is inspired and largely copied from bernd's [cucumber-sinatra gem](https://github.com/bernd/cucumber-sinatra) 

# Installation

It's available as a gem that can be installed with the following command.

        gem install rspec-sinatra

To use the generated templates without any modification, you'll have to install the capybara (at least v1.0.0) gem as well.

# Usage

To initialize the rspec environment, just execute `rspec-sinatra` like this:

        # rspec-sinatra init MyApp lib/my_app.rb
             [ADDED]  spec/spec_helper.rb
        #

* The first argument is the class name of your application.
* The second argument is the path to the application file that should be required.

Using the `--app` option with `init` will also generate the given application file
and a working `config.ru`.

        # rspec-sinatra init --app MyApp lib/my_app.rb
             [ADDED]  spec/spec_helper.rb
             [ADDED]  lib/my_app.rb
             [ADDED]  config.ru
        #

# Copyright


This code is licensed under a BSD license.

See the LICENSE file for a copy of the license.
