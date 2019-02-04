require 'sinatra/base'
require './lib/peeps.rb'
require 'date'
require_relative './database_connection_setup.rb'

class Peeps < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb(:index)
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do

    redirect '/'
  end

  get '/register' do
    erb :register
  end

  post '/register_new' do
    redirect '/'
  end

  get '/view_peeps' do
    @peeps = Peep.all
    erb :view_peeps
  end

  delete '/peeps/:id' do
  Peep.delete(id: params[:id])
  redirect '/view_peeps'
  end

  get '/add_peep' do
   erb :add_peep
  end

  post '/create_peep' do
   p "New post added at #{Time.now.strftime('%d-%m-%Y %H:%M:%S')}"
   Peep.create(comment: params[:peepbox], date_posted: Time.now.strftime('%d-%m-%Y %H:%M:%S'))
   # erb(:view_peeps)
   redirect '/'
  end

  get '/home' do
   redirect '/'
 end
end
