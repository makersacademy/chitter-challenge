require 'sinatra/base'
require './lib/sign_up.rb'
require './lib/messages.rb'

class Chitter < Sinatra::Base

  get '/sign_up' do
    erb :'sign_up'
  end

  post '/sign_up_process' do
    params[:username]
    params[:name]
    params[:email]
    params[:password]
    redirect '/sign_up_confirmation'
  end

  get '/sign_up_confirmation' do
    erb :'sign_up_confirmation'
  end

  run! if app_file == $0
end
