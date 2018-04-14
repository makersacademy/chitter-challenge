require 'sinatra/base'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :home
  end

  post '/' do
    Peep.add(params)
    redirect '/'
  end

  post '/users/new' do
    erb :sign_up
  end

  post '/peeps/user' do
    @name = params[:name]
    erb :user_home
  end

end
