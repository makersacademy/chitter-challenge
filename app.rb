require 'sinatra/base'
require_relative './lib/user'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  set :public_folder, Proc.new { File.join(root, 'public') }

  get '/' do
    erb(:index)
  end

  get '/user/new' do
    erb(:sign_up)
  end

  post '/user/new' do
    session[:user] = User.create(params[:username])
    redirect '/'
  end

  # defines @current_user before each route
  before do
    @current_user = session[:user]
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
