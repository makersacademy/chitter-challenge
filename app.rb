$LOAD_PATH << File.join(File.dirname(__FILE__), '/lib')

require './config/environments/development.rb'
require 'peeps'
require 'users'
require 'application'
