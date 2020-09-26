require 'sinatra'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get "/new_peep" do
    erb(:new_peep)
  end

  post "/new_peep" do
    p params[:peep]
    Peep.add(params[:peep])
    redirect("/feed")
  end

  get "/feed" do
    
    erb(:home)
  end

  get "/" do
    erb(:login_signup)
  end

  get "/signup" do
    erb(:signup)
  end

  get '/login' do
    erb(:login)
  end

  post "/register" do
  puts params
  end

  post "/signed_in" do
    puts params
  end 


end