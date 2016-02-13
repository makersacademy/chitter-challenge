ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'rest_client'
require_relative 'dm_setup'

class ChitterApp < Sinatra::Base

  get '/' do
    erb :index
    # need to chow peeps on index; check for login
  end

  get '/users/sign_up' do
    erb :sign_up
  end

  post '/users/sign_up' do
    new_user = User.new(
                        username:   params[:username],
                        real_name:  params[:real_name],
                        email:      params[:email],
                        password:   params[:password],
                        )
    new_user.save
    # if new_user.save

    # end


  end






  # start the server if ruby file executed directly
  run! if app_file == $0
end
