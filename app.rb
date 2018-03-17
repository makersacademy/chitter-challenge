require './lib/phoenix.rb'
require 'sinatra'
require 'sinatra/base'



class PhoenixController < Sinatra::Base
  enable :sessions
  set :session_secret, 'My Secret Session'

  get '/' do
    redirect '/phoenix'
  end

  get '/phoenix' do
    @phoenix = Phoenix.all
    erb(:index)
  end

  post '/phoenix/summon' do
    Phoenix.summon(params[:new_phoenix])
    redirect '/phoenix'
  end

  run! if app_file == $0
end
