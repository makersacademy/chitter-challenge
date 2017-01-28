require 'rubygems'
require_relative ('app/app.rb')
require 'data_mapper'



BookmarkManager.run! port: 9292, bind: '0.0.0.0'
