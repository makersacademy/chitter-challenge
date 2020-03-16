require 'sinatra/base'
require './lib/chitter'

class ChitterChallenge < Sinatra::Base

  get '/chitter' do
    @peeps = Chitter.print_peeps
    erb :chitter
  end

  get '/chitter/sign_up' do
    erb :'chitter/sign_up'
  end

  post '/chitter/sign_up' do
    Chitter.sign_up(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/chitter/user'
  end

  get '/chitter/user' do
    @user = Chitter.sign_up(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    @peeps = Chitter.print_peeps
    erb :'/chitter/user'
  end

  get '/chitter/post_peep' do
    erb :'chitter/post_peep'
  end

  post '/chitter/post_peep' do
    Chitter.post_peep(peep: params[:peep], post_time: Peep.time, post_date: Peep.date)
    redirect '/chitter/user'
  end

  run! if app_file == $0
end
