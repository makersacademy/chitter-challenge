require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :sign_in
  end

  get '/create_account' do
    erb :create_account
  end

  post '/account_created' do
    session[:name] = params[:name]
    User.add(name: params[:name], password: params[:password], email: params[:email])
    erb :account_created
  end

  get '/home' do
    @name = session[:name]
    @peeps = Peep.all
    erb :home
  end

  get '/post' do
    erb :post
  end

  post '/home' do
    time = Time.new.strftime("%d/%m %H:%M")
    Peep.add(post: params[:post], time: time)
    redirect :home
  end

end
