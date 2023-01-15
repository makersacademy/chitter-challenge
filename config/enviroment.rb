require_relative "../app"

ENV["RACK_ENV"] ||= "production"

require "bundler/setup"
Bundler.require(:default, ENV["RACK_ENV"])
