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
    redirect '/chitter/user'
  end

  get '/chitter/user' do
    erb :'/chitter/user'
  end

  get '/chitter/post_peep' do
    erb :'chitter/post_peep'
  end

  post '/chitter/post_peep' do
    Chitter.post_peep(peep: params[:peep], post_time: Time.now.strftime('%H:%M'), post_date: Date.today)
    redirect '/chitter'
  end

  run! if app_file == $0
end
