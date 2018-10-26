require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user'
require_relative './lib/peep'
require_relative './lib/chitter'

class ChitterApp < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb :index
  end

  post '/welcome' do
    if User.exists?(params[:username], params[:email])
      flash[:sign_up] = "Sorry those details have already been registered, please try again"
      redirect '/'
    else
      User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
      current_user = User.all.select { |user| user.name == params[:name] }.first
      @name = current_user.name
      erb :welcome
    end
  end

  get '/post' do
    erb :post
  end

  post '/post' do
    Peep.create(params[:peep], Time.now)
    flash[:post] = "Peep posted"
    redirect '/post'
  end

  get '/chitter' do
    @peeps = Chitter.all(Peep)
    erb :chitter
  end

  run! if app_file == $0
end
