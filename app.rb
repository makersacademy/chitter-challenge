require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:new_user)
  end

  post '/completed_reg_form' do
    session[:Username] = params[:Username]
    session[:Email_Address] = params[:Email_Address]
    session[:Password] = params[:Password]
    redirect '/welcome_to_chitter'
  end

  get '/welcome_to_chitter' do
    @username = session[:Username]
    @email_address = session[:Email_Address]
    @password = session[:Password]
    erb(:welcome_to_chitter)
  end

  run! if app_file == $0

end
