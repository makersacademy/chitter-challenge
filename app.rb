require 'sinatra/base'
require_relative './lib/piep.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chitter' do
    @username = session[:username]
    @piepjes = Piep.all
    erb :piepjes
  end

  get '/chitter/add_piepje' do
    erb :new_piepje
  end

  post '/new_piepje_data' do
    Piep.create(params[:text], session[:username])
    redirect('/chitter')
  end

  get '/new_user' do
    erb :new_user_form
  end

  post '/new_user_data' do
    session[:username] = params[:username]
    redirect('/chitter')
  end

  run! if app_file == $0
end
