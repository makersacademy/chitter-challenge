require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'sinatra/activerecord'
require 'sinatra/flash'
require_relative './lib/post.rb'
require_relative './lib/user.rb'

set :database_file, 'config/database.yml'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    @recent_posts = Post.last(10).reverse
    erb :index
  end

  get '/new_post' do
    erb :new_post
  end

  post '/new_post' do
    Post.create(username: 'Test',
                name: 'Test', 
                message: params[:new_post], 
                time_posted: DateTime.now.strftime("%H:%M %b %e")
              )
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    if User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username]).valid?
      flash[:alert] = 'Account successfully created'
      redirect '/'
    else
      flash[:alert] = 'The email or username is already in use please try another'
      redirect '/sign_up'
    end
    
    
  end

end
