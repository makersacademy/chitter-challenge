ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  # enable :sessions

  get '/' do
    erb(:index)
  end

  post '/users' do
    maker = Maker.create(
              full_name:              params[:full_name],
              user_name:              params[:user_name],
              email:                  params[:email],
              password:               params[:password],
              password_confirmation:  params[:password_confirmation]
    )
    redirect('/peeps')
  end

  post '/signup' do
    erb(:signup)
  end

  get '/peeps' do
    "peeps"
  end

end
