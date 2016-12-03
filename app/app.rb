ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    @user = User.create(email: params[:email] , name: params[:name],
    username: params[:username], password_digest: params[:password_digest] )
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
