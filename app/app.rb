ENV['RACK_ENV'] ||= 'development'

 require 'sinatra/base'
 require_relative 'data_mapper_setup'

 class Chitter < Sinatra::Base

   get '/' do
     redirect '/peeps'
   end

   get '/peeps' do
     @peeps = Peep.all
     erb :'peeps/index'
   end

   get '/peeps/new' do
     erb :'peeps/new_peep'
   end

   post '/peeps' do
     time = Time.now.strftime("%c").to_s
     peep = Peep.create(message: params[:message], time: time)
     peep.save
     redirect '/peeps'
   end

 end
