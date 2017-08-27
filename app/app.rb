require_relative './data_mapper_setup'
require 'sinatra/base'

class ChitterChallenge < Sinatra::Base

  get '/homepage' do
    erb(:homepage)
  end

  post '/signup' do
    erb(:signup)
  end

  post '/welcome' do
    User.create(email: params[:email],
                password: params[:password])
    redirect '/feed'
  end

  get '/feed' do
    erb(:index)
  end

  post '/new' do
    Message.create(body: params[:body], name: params[:name])
    redirect '/feed'
  end

end
