require 'sinatra/base'
require './lib/chitter'
require './lib/user'

class App < Sinatra::Base

enable :sessions

  get '/chitter' do
    @user = session[:current_user]
    @peeps = Chitter.all
    erb(:index)
  end

  post '/peep_post' do
    Chitter.create_peep(params[:name], params[:username], params[:peep])
    redirect to('/chitter/peeps')
  end

  get '/chitter/peeps' do
    @peeps = Chitter.all
    erb(:index)
  end

  post '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up_post' do
    @user = User.create(params[:name], params[:username], params[:email], params[:password])
    session[:current_user] = @user
    redirect to('/chitter')
  end

  run! if app_file == $0
end
