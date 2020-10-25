require 'sinatra/base'
require './lib/makers'

class Chitter < Sinatra::Base
  enable :sessions
  # attr_reader :username

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
    @makers = Makers.all
    # @makers = [session[:Username], session[:Email_Address], session[:Password]]
    erb(:welcome_to_chitter)
  end

  run! if app_file == $0

end
