require 'sinatra/base'
require './lib/chitter'
require './lib/user'

class ChitterManager < Sinatra::Base
  enable :sessions

  get '/' do
    @all_peeps = Chitter.all_peeps.reverse
    erb(:index)
  end

  post '/peep' do
    Chitter.peep(params[:new_peep])
    redirect '/'
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/user_details' do
    session[:name] = params[:name]
    session[:username] = params[:username]
    User.create(params[:name], params[:username], params[:email], params[:password])
    redirect '/'
  end

  get '/login' do
    erb(:login)
  end

  post '/login_details' do
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect '/'
  end

  run! if app_file == $0
end
