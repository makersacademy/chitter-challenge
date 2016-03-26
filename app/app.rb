ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/chit'

class Chitter < Sinatra::Base

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  get '/new' do
    erb :'chits/new'
  end

  post '/new' do
    Chit.create(post: params[:post], time: Time.now.strftime("%d/%m/%Y %H:%M"))
    redirect '/chits'
  end

end
