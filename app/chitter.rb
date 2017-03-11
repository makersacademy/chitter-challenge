require 'sinatra'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/users' do
    Maker.create(
      full_name:              params[:full_name],
      user_name:              params[:user_name],
      email:                  params[:email],
      password:               params[:password],
      password_confirmation:  params[:password_confirmation]
    )
    redirect('/peeps')
  end

  get '/peeps' do
    "peeps"
  end

end
