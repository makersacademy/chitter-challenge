require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

set :database_file, 'config/database.yml'

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  enable :sessions, :method_override

  get '/' do
    'Hello world!'
    redirect '/users/new'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.order(created_at: :desc)
    erb :index
  end

  post '/peeps/new' do
    @peep = Peep.create(content: params[:content])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
    )
    session[:user_id] = user[:id]
    redirect '/peeps'
  end

  run! if app_file == $0

end