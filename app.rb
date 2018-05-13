require 'sinatra/base'
require './lib/users.rb'
require 'sinatra/flash'
require './lib/peeps.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/chitter' do
    @peeps = Peeps.all
    @current_user = session[:username]
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    name, username, email, password = params[:name], params[:username], params[:email], params[:password]
    if Users.create(name, username, email, password) == 'username error'
      flash[:username_error] = 'This username is already taken'
      redirect('/sign_up')
    elsif Users.create(name, username, email, password) == 'email error'
      flash[:email_error] = 'This email is already in use'
      redirect('/sign_up')
    else
      redirect('/user_added')
    end
  end

  get '/user_added' do
    erb :user_added
  end

  get '/sign_in' do
    erb :sign_in
  end

# TO BE REFACTORED
  post '/sign_in' do
    if Users.username_available?(params[:username]) == false
      if Users.match?(params[:username], params[:password]) == false
        flash[:wrong_password] = 'Wrong password'
        redirect('/sign_in')
      else
      session[:username] = params[:username]
      redirect('/chitter')
      end
    else
      flash[:user_does_not_exist] = "This user doesn't exist"
      redirect('/sign_in')
    end
  end

  get '/sign_out' do
    session[:username] = nil
    redirect '/chitter'
  end

  get '/new_peep' do
    unless session[:username] != nil
      flash[:not_signed_in] = 'Sign in before you peep!'
      redirect('/chitter')
    end
   erb :new_peep
  end

  post '/new_peep' do
    current_user = session[:username]
    current_user_name = Peeps.name(current_user)
    peep_text = params[:text]
    time = Time.now.strftime('%I:%M%P')
    Peeps.peep(current_user_name, current_user, time, peep_text)
    redirect '/chitter'
  end

  run! if app_file == $0
end
