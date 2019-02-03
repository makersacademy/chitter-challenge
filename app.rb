require 'sinatra/base'
require_relative 'lib/peep'
require_relative 'spec/web_helpers'
require_relative 'lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/signup/new' do
     erb(:signup)
  end

  post '/signup' do
    @user = User.add(username: params[:username], password: params[:password])
    session[:user_id] = @user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:peeps)
  end

  post '/post_peep' do
    Peep.post(peep: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
