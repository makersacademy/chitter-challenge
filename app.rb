require 'sinatra'
require './lib/chitter_model'


class Chitter < Sinatra::Base

  get '/' do
    redirect '/chitter/homepage'
  end

  get '/chitter/homepage' do
  erb :'/homepage'
  end

  get '/chitter/view' do
    @chitts = Chitter_Model.all
    erb :'/view'
  end

  get '/chitter/login' do
    erb :'/login'
  end

  get '/chitter/post' do
    erb :'/post'
  end

  post '/chitter/posting' do
    if @username == nil
      @username = "Noone"
    end
    Chitter_Model.create(username: @username,chitt: params[:chitt],time: Time.now)
    redirect '/'
  end

  get '/chitter/logout' do
    erb :'/logout'
  end
end