require 'sinatra'
require 'sinatra/base'
require './lib/peep'
require 'sinatra/flash'

 class Chitter < Sinatra::Base

   configure do
     # use Rack::MethodOverride
     enable :sessions
     register Sinatra::Flash
   end

   get '/' do
     redirect '/peeps'
   end

   get '/peeps' do
     @peeps = Peep.all
     erb :peeps
   end

   post '/peeps' do
     Peep.create(params[:peep])
     redirect '/peeps'
   end

   get '/users/new' do
     erb :signup
   end

   post '/users' do
     User.create(email: params['email'], password: params['password'])
     redirect '/bookmarks'
   end



 end
