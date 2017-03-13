ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'models/user'
require_relative '../data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    #sign up, log in
    #You don't have to be logged in to see the peeps.
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    #enable sessions, attribute IDs etc
    session['username'] = params[:Username]
    session['password'] = params[:Password]
    session['email'] = params[:Email]
    redirect '/sign_up_success'
  end

  get '/sign_up_success' do
    @User = User.create(username: session['username'], password: session['password'], email: session['email'])
    erb :sign_up_success
  end
end
