require "rubygems"
require File.join(File.dirname(__FILE__), "app/app.rb")

require "sass/plugin/rack"
Sass::Plugin.options[:style] = :compressed
Sass::Plugin.options[:css_location] = "./app/public/stylesheets"

use Sass::Plugin::Rack

run Chitter
