require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    # "Welcome to Chitter!"
    erb :'peeps/index'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/show'
  end

  get '/peeps/post' do
    @username = session[:username]
    erb :'peeps/post'
  end

  post '/peeps' do
    p "Form data submitted here!"
    p params
    Peeps.post(message: params['message'])
    redirect '/peeps'
  end

  get '/sign_up' do
      erb :sign_up
    end

    post '/sign_up' do
      session[:username] = params[:username]
      redirect '/peeps'
    end

  run! if app_file == $0
end
