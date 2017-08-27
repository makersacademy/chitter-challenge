ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
# require 'sinatra'
require_relative './models/peep.rb'
require_relative './models/user.rb'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'links/index'
  end

  get '/signup' do 
    erb :'links/signup'
  end
  
  post '/signup_complete' do
    User.create(:name => params[:name], :email => params[:email], :username => params[:username], :password => params[:password])
    redirect '/peep/new'
  end
  
  get '/peep/new' do
    erb :'links/peep_new'
  end
  
  post '/peeps' do
    Peep.create(:content => params[:my_peep])
    redirect '/peeps'
  end

end
