require 'data_mapper'
require 'sinatra/base'
require './lib/peep'
require './lib/user'
require_relative 'data_mapper_setup'
require_relative 'helpers/users'


class Chitter < Sinatra::Base
  include Helpers
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    content = params['content']
    hashtag = params['hashtag']
    Peep.create(content: content, hashtag: hashtag)
    redirect to('/')
  end

  get '/users/new' do
     erb :users
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password])
    session[:user_id] = user.id
    redirect to('/')
  end
end