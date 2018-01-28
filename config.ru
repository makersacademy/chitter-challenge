require './app/app'
ENV['RACK-ENV'] ||= "development"
run Chitter
