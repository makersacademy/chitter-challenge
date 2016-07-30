require 'rubygems'
require File.join(File.dirname(__FILE__), 'app/app.rb')

config.time_zone = 'Berlin'
config.active_record.default_timezone = :local

run Chitter
