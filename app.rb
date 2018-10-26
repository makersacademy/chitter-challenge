require 'sinatra'
require './lib/peep'
require './lib/user'

class ChitterApp < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/post' do
    Peep.post(params[:name], params[:username], params[:post])
    redirect '/peeps'
  end

  before do
    @user = User.instance
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/signed_up' do
    @user = User.sign_up(params[:email], params[:password], params[:name], params[:username])
    redirect '/user_peeps'
  end

  get '/user_peeps' do
    @name = @user.username
    @peeps = Peep.all
    erb :signed_in_peeps
  end

  run! if app_file == $0
end
