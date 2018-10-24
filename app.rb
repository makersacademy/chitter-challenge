require 'sinatra/base'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    session[:name] = params[:name]
    session[:username] = params[:username]
    session[:email_address] = params[:email_address]
    session[:password] = params[:password]
    redirect "/#{params[:username]}"
  end

  get '/:username' do
    @name = session[:name]
    @username = session[:username]
    erb :profile
  end

    run! if app_file == $0
end
