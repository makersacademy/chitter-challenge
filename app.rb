require 'sinatra'
require './lib/posts.rb'

class Chitter < Sinatra::Base

  get '/' do
    @post = Posts.show
    erb :index
  end

  get '/add' do
    erb :form
  end

  post '/new' do
    Posts.create(name: params[:name], message: params[:message])
    redirect '/'
  end

  run! if app_file == $0

end
