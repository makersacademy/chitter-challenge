require 'sinatra'
require './db_setup'

class Chitter < Sinatra::Base

  enable :sessions

  before do
    @user = session[:current_user]
  end

  get '/' do
    'testing fraemwork working'
  end

  get '/peeps' do
    @peeps = Peep.sort_by_date_created(Peep.all)
    erb(:peeps)
  end

  post '/peeps' do
    Peep.new(body: params[:body], created_by: @user.id).save
    redirect('/peeps')
  end

  get '/sign-up' do
    erb(:sign_up)
  end

  post '/sign-up' do
    User.new(name: params[:name], user_name: params[:username], email: params[:email], password: params[:password]).save
    redirect('/peeps')
  end

  get '/log-in' do
    erb(:log_in)
  end

  post '/log-in' do
    p params[:username]
    p User.all
    if @current_user = User.all(User.user_name => params[:username]).first
      if @current_user.password == params[:password]
        session[:current_user] = @current_user
        redirect('/peeps')
      end
    end
    'failed to log in'
  end

  get '/log-out' do
    session[:current_user] = nil
    redirect('/peeps')
  end
end
