require 'sinatra/base'
require './lib/users.rb'
require './lib/messages.rb'

class Chitter < Sinatra::Base

  get '/' do
    @messages = Messages.all
    erb :'homepage'
  end

  post '/post_message' do
    Messages.create(username: params[:username], name: params[:name], message: params[:message])
    redirect '/'
  end

  get '/sign_up' do
    erb :'sign_up'
  end

  post '/sign_up_process' do
    Users.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
      redirect '/sign_up_confirmation'
  end

  get '/sign_up_confirmation' do
    erb :'sign_up_confirmation'
  end


  run! if app_file == $0
end
