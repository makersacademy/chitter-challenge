
require 'sinatra/base'
require_relative 'models/user'

require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  get '/sign_up' do


    erb :'users/user_sign_up_form'
   end


   post '/usercreate'do
    User.create(name: params[:name], username: params[:username], email: params[:email])
   redirect '/confirm'
 end

 get '/confirm' do
  'Welcome First User'

 end
     run! if app_file == $0


 end

