require 'sinatra/base'
require './lib/cheet'

class Chitter < Sinatra::Base

  get '/' do
    @cheets = Cheet.all.reverse
    erb :index
  end

  get '/register' do
    erb :register
  end

  post '/registered' do
    email = params[:Email]
    name = params[:Name]
    user = params[:Username]
    pass = params[:Password]
    confirm = params[:Confirm_Password]
    User.create(email, name, user, pass, confirm)
    redirect '/'
  end

  post '/new-cheet' do
    Cheet.create(params[:cheet])
    redirect '/'
  end

end
