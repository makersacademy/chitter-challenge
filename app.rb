# frozen_string_literal: true

require 'sinatra/base'
require './lib/post_message.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/chitter' do
    session[:username] = params[:username]
    redirect '/chitter'
  end

  get '/chitter' do
    @username = session[:username]
    @all_posts = PostMessage.all
    erb :chitter
  end

  get '/peep/new' do
    erb :'/peep/new'
  end

  post '/peep/new' do
    PostMessage.post(params[:content],session[:username])
    redirect '/chitter'
  end
end
