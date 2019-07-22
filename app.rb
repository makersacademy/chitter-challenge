require 'sinatra/base'
require_relative 'lib/posts'



class WebChitter < Sinatra::Base
  enable :sessions, :method_override
  set :session_secret, 'eleven'

  get '/' do
    @posts = params[:peep]
    erb :index
  end

  get '/posts' do
    @posts = Posts.show_posts
    erb :posts
  end

  post '/posts' do
    Posts.create(peep_text: params[:peep], user_name: params[:user], created_at: params[:date])
    # connection.exec("INSERT INTO peeps_test (peep_text, user_name, created_at) VALUES('#{peep_text}', '#{user_name}', '#{created_at}')")
    redirect '/posts'
  end

  get '/posts/new' do
    erb :posts
  end

  delete '/posts/:id' do
   Posts.delete(id: params[:id])
   redirect '/posts'
  end
end
