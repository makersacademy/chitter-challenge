ENV["RACK_ENV"] ||= "development"
require 'sinatra'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  get '/' do
    redirect('/posts')
  end

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    peep = Post.create(content: params[:content])
    peep.save
    redirect('/posts')
  end

end
