ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(username: params[:username], name: params[:name], email: params[:email],
    password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/peeps')
    else
      flash.now[:error] = @user.errors.full_messages.join("; ")
      erb :'users/new'
    end
  end

  get '/peeps' do
    @list = Peep.all
    @user = current_user
    erb :index
  end

  get '/sessions/new' do
    @user = User.new
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:error] = 'Email or password is incorrect'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Come back soon'
    redirect to '/link'
  end

  # get '/links/new' do
  #   erb(:new_link)
  # end
  #
  # post '/links' do
  #   @link = Link.create(:title => params[:title], :url => params[:url])
  #   params[:tag].split(",").map(&:strip).each do |tag|
  #         @link.tags << Tag.first_or_create(tag: tag)
  #     end
  #     @link.save
  #   redirect '/links'
  # end
  #
  # post '/tags' do
  #   @search = params[:search]
  #   redirect "/tags/#{@search}"
  # end
  #
  # get '/tags/:search' do
  #   # check it's a tag
  #   @user = current_user
  #   tag = Tag.first(tag: params[:search])
  #   @list = tag ? tag.links : []
  #   erb(:links)
  # end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
