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

  get '/phoenix/summon' do
    @phoenix = Phoenix.summon(params[:new_phoenix])
  end

  run! if app_file == $0
end
