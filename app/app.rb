require_relative './data_mapper_setup'
require 'sinatra/base'

class ChitterChallenge < Sinatra::Base


  get '/homepage' do
    erb(:index)
  end

  post '/new' do
    Message.create(body: params[:body], name: params[:name])
    redirect '/homepage1'
  end

  get '/homepage1' do
    erb(:messages)
  end
end
