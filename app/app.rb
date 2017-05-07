ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative '../data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb(:homepage)
  end

  get '/sign-up' do
    erb(:sign_up)
  end

  post '/sign-up' do
    User.create(email: params[:email],
                password_digest: params[:password],
                name: params[:name], username: params[:username])
    redirect to('/thank-you')
  end

  get '/thank-you' do
    erb(:completed_sign_up)
  end

end
