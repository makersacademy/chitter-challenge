require 'sinatra/base'
require './lib/peeps'
require './lib/users'
require 'sinatra/flash'


class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions


  get '/chitterfeed' do
    @signupalert = session[:need_to_sign_up]
    @signinconfirm = session


    @peeps = Peeps.all
    erb :chitterfeed


  end

  get '/chitterfeed/logged_in' do
    @message = 'Thank you for logging in, you may now post!'
    erb :chitterfeedloggedin

  end

  get '/chitter' do
  session[:sign_up] = 'Please log in or sign up to post to chitter'


    @message = session[:sign_up]

    erb :signin


  end

  post '/viewpeeps' do
    if Peeps.is_user?(params[:username])
     session[:logged_in] = 'Thank you for logging in'

      redirect '/chitterfeed/logged_in'
    else
     redirect '/chitter'

    end
  end

    # redirect '/viewpeeps' unless @not_user
  post '/chitterfeed' do
    if Peeps.is_user?(params[:username]) && params[:password].length > 0
      erb :chitterfeed
    elsif Peeps.is_user?(params[:username]) && params[:password].length < 0
    end
  end


  get '/peeps' do

  end

  run! if app_file == $PROGRAM_NAME


end
