ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
# require 'sinatra'
require_relative './models/peep.rb'



class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'links/index'
  end

  get '/peep/new' do
    erb :'links/peep_new'
  end
  
  post '/peeps' do
    Peep.create(:content=>params[:my_peep], :user_handle=>params[:username], :name=>params[:name])
    redirect '/peeps'
  end

end
