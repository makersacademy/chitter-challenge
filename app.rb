require 'sinatra/base'
require './lib/peeps'
require './lib/users'
require 'sinatra/flash'


class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions


  get '/viewpeeps' do

  end

  get '/chitter' do

    @message = session[:need_to_sign_up]

    erb :signin


  end

  post '/viewpeeps' do

    if Peeps.is_user?(params[:username])
      redirect '/viewpeeps'
    else
      session[:need_to_sign_up] = 'Log in details not found, please click sign up'
      redirect '/chitter'

    end

    # redirect '/viewpeeps' unless @not_user

  end

  run! if app_file == $PROGRAM_NAME


end
