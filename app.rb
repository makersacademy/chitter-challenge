require 'sinatra/base'
require './lib/peep'
require './lib/user'

class ChitterApp < Sinatra::Base

  get '/chitter' do
    @message = params[:message]
    @peep = Peep.all
    erb :index
  end

  post '/chitter' do
    @message = params[:message]
    @name = params[:name]
    @username = params[:username]
    Peep.add_message(params['message'])
    User.login_details(params['name'], params['username'], params['email'], params['password'])
    @peep = Peep.all
    erb :index
  end

  # post '/chitter/create_new' do
  #   @message = params[:message]
  #   @peep = Peep.all
  #   redirect '/chitter'
  # end
end
