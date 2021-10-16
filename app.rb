require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(id: session[:user]) if session[:user]
    @peeps = Peep.all
    @signup = params[:signup]
    erb :index, :layout => :base
  end

  get '/user/new' do
    erb :'user/new', :layout => :base
  end

  post '/user' do
    if User.unique?(username: params[:username], email: params[:email])
      @user = User.create(username: params[:username], email: params[:email],
      first_name: params[:first_name], last_name: params[:last_name], password: params[:password])
      session[:user] = @user.id
      redirect("/?signup=true")
    else
      flash[:notice] = "That username or email already exists"
      redirect('/user/new')
    end
  end
  #halt erb(:error) unless User.unique_email?(email: params[:email])

  #halt erb(:error) for later use

  post '/peep/new' do
    text = params[:peep_text]
    Peep.create(text: text)
    redirect('/')
  end

  run! if app_file == $0
end
