require 'data_mapper'
require 'sinatra'
require 'rack-flash'
require './app/models/link'
require './app/models/tag'
require './app/models/user'


env = ENV[ 'RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!

class BMarkManager < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/links' do
    url = params["url"]
    title = params["title"]
    tags = params["tags"].split(" ").map do |tag|
      Tag.first_or_create(:text => tag)
    end
    Link.create(:url => url, :title => title, :tags => tags)
    redirect to('/')
  end

  get '/tags/:text' do
    tag = Tag.first(:text => params[:text])
    @links = tag ? tag.links : []
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :"users/new"
  end

  post '/users' do
    @user =User.new(:email => params[:email],
                :password => params[:password],
                :password_confirmation => params[:password_confirmation])

    if @user.save
       session[:user_id] = @user.id
       redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end
  end


  run! if app_file ==$0

end