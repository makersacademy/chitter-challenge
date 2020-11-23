require 'sinatra/base'
require_relative './lib/user'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  set :public_folder, Proc.new { File.join(root, 'public') }

  get '/' do
    @peeps = Peep.all.sort_by(&:time).reverse
    erb(:index)
  end

  get '/user/new' do
    erb(:sign_up)
  end

  post '/user/new' do
    session[:user] = User.create(params[:username])
    redirect '/'
  end

  get '/peep/new' do
    erb(:new_peep)
  end

  post '/peep/new' do
    Peep.create(@current_user.id, params[:content], Time.now.strftime("%Y/%m/%d"), Time.now.strftime("%H:%M:%S"))
    redirect '/'
  end

  # defines @current_user before each route
  before do
    @current_user = session[:user]
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
