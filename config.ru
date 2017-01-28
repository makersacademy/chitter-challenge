require 'rubygems'
require_relative ('lib/app.rb')
require 'data_mapper'

Tweeter.run! port: 9292, bind: '0.0.0.0'
