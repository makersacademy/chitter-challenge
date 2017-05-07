ENV['RACK_ENV'] ||='development'

require 'sinatra/base'
require 'pry'
require_relative './models/data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/sign-up' do
    erb :sign_up
  end

  post '/sign-up/complete' do
    User.create(name: params[:name], user_name: params[:user_name], email: params[:email], password: params[:password])
    redirect '/'
  end

  post '/post-peep' do
    Peep.create(post: params[:peep_text])
    binding.pry
    redirect '/'
  end

end
