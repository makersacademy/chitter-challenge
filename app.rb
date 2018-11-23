require 'sinatra/base'
require './database_connection_setup'
require_relative './lib/peep.rb'
require 'time'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/homepage'
  end

  get '/homepage' do
    @peep = session[:peep_content]
    erb(:homepage)
  end

  post '/new' do
    dummy_user = DatabaseConnection.query("INSERT INTO users (name, user_name, \
       email, password) VALUES ('Dummy User', 'DummyUsername', \
         'dummyemail@domain.com', 123456789) RETURNING userid, name, \
         user_name, email, password;")
    session[:peep] = Peep.create(userid: dummy_user[0]['userid'], \
      timestamp: Time.now, content: params[:peep_content], \
      threadpeep: params[:peep_content])
    session[:peep_content] = params[:peep_content]
    redirect '/homepage'
  end

  run! if app_file == $0
end
