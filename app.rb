require 'pg'
require 'sinatra'
require 'sinatra/flash'
require_relative './lib/users.rb'
require_relative './lib/peep.rb'


class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :home
  end

  post '/new-peep' do
    Peep.create(text: params[:text], user_id: session[:user_id])
    redirect '/'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    user = Users.create(name: params[:name], email: params[:email], password: params[:password], username: params[:username])
    
    session[:user_id] = user.id

    redirect '/sign-up-thanks'
  end

  get '/sign-up-thanks' do
    erb :su_thanks
  end

  get '/sign-in' do
    erb :sign_in
  end

  post '/sign-in' do
    user = Users.authenticate(username: params[:username], password: params[:password])
    
    if user 
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Invalid details'
      redirect('/')
    end

    
  end

  run! if app_file == $0

end
