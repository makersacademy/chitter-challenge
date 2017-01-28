ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'dmconfig'
require_relative 'server'

ChitterApp.run! if $0 == 'app/app.rb'
