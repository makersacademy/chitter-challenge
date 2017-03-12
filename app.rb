ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/models/dm_config'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/create_user' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    session[:user_email] = user.email
    redirect '/confirmation'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/confirmation' do
    erb :confirmation
  end

  post '/signin' do
    #some magic to check credentials
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/add' do
    erb :add
  end

  post '/peeps' do
      # Peep.create(content: params[:peep_content])
      peep = Peep.create(content: params[:peep_content])
      params[:hashtags].split.each do |h|
        peep.hashtags << Hashtag.first_or_create(name: h)
      end
      peep.save
      redirect '/peeps'
  end

  get '/hashtags/:name' do
    hashtag = Hashtag.first(name: params[:name])
    @peeps = hashtag ? hashtag.peeps : []
    erb :'peeps/index'
  end

end
