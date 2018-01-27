ENV["RACK_ENV"] ||= "development"
 require 'sinatra/base'
 require 'data_mapper'
 require_relative './models/peep'

 class Chitter < Sinatra::Base

   get '/peeps' do
     'first peep'
   end

 run! if app_file == $PROGRAM_NAME
 end
