ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require_relative 'models/user_details'

class Chitter < Sinatra::Base
  get '/' do
    redirect to('/sign_up')
  end

  get '/welcome_page' do
    erb :welcome_page
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    @user = UserDetails.first_or_create(:handle   => params[:handle],
                                        :name     => params[:name],
                                        :email    => params[:email],
                                        :password => params[:password]
                                        )
    @user.save

    redirect to('/welcome_page')

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
