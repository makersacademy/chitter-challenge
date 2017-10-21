ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/data_mapper_setup'



class Chitter < Sinatra::Base
  enable :sessions

  get '/infrastructure' do
    'infrastructure working'
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/feed' do
    session[:peep] = params[:peep]
    redirect '/feed'
  end

  get '/feed' do
    @peep = session[:peep]
    erb :feed
  end
end
