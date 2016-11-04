require './app/models/user.rb'

 class Chitter < Sinatra::Base

   get '/home' do
     @peeps = Peep.all(:order => [ :created_at.desc ])
     erb :'/peeps/home'
   end

   post '/peeps/new' do
     user = current_user
     user.peeps.create(text: params[:peep])
     redirect '/home'
   end

 end
