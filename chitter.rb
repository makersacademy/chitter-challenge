require 'sinatra/base'
require './lib/peeps.rb'
require 'date'
require_relative './database_connection_setup.rb'

class Peeps < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb(:index)
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
   p "New post added at #{Time.now}"
   Peep.create(comment: params[:peepbox], date_posted: Time.now)
   # erb(:view_peeps)
   redirect '/'
  end

  get '/home' do
   redirect '/'
 end
end
