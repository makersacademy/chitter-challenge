require './lib/phoenix.rb'
require 'sinatra'
require 'sinatra/base'
require 'envyable'
Envyable.load('config/env.yml')


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

  get '/phoenix/reraise' do
    @fenix = Phoenix.find(params[:reraise_id])
    erb(:reraise)
  end

  post '/phoenix/reraise/confirm' do
    Phoenix.reraise(params[:reraise_id], params[:reraise_text]) if params[:reraise_confirm] == "Confirm"
    redirect '/phoenix'
  end

  post '/phoenix/dismiss' do
    Phoenix.dismiss(params[:dismiss_id])
    redirect '/phoenix'
  end

  run! if app_file == $0
end
