require 'sinatra'
require './db_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'testing fraemwork working'
  end

  get '/peeps' do
    @peeps = Peep.sort_by_date_created(Peep.all)
    @user = session[:current_user]
    erb(:peeps)
  end

  post '/peeps' do
    Peep.new(body: params[:body]).save
    redirect('/peeps')
  end

  get '/sign-up' do
    erb(:sign_up)
  end

  post '/sign-up' do
    User.new(name: params[:name], user_name: params[:username], email: params[:email], password: params[:password]).save
  end

  get '/log-in' do
    erb(:log_in)
  end

  post '/log-in' do
    if @current_user = User.all(User.user_name => params[:username]).first
      if @current_user.password == params[:password]
        session[:current_user] = @current_user
        redirect('/peeps')
      end
    end
  end
end
