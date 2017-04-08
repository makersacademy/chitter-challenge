ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message])
    hashtags = params[:hashtags].gsub(/\s/,'').split(',')
    hashtags.each do |hashtag|
      peep.hashtags << Hashtag.first_or_create(name: hashtag)
    end
    peep.save
    redirect '/peeps'
  end

  get '/hashtags/:name' do
    hashtag = Hashtag.first(name: params[:name])
    @peeps = hashtag ? hashtag.peeps : []
    erb :'/peeps/index'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/peeps'
  end
end
