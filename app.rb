require 'sinatra/base'
require './lib/peeps'
require './lib/user'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    p user.id
    redirect '/new'
  end

  get '/new' do
    erb :new
  end

  post '/peeps' do
    Peeps.create(params[:username], params[:content], Time.now)
    redirect '/'
  end

  run! if app_file == $0

end
