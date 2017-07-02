ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end 

  get '/peeps/new' do
    erb :'/peeps/new'
  end 
  
  post '/peeps' do
    peep = Peep.create(text: params[:text])
    peep.save
    redirect to('/peeps')
  end 

  get '/users/new' do
    erb :'/users/new'
  end 

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       name: params[:name],
                       username: params[:username])
    user.save
    redirect to('/peeps')                    
  end 
end 
