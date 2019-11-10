require 'sinatra'


class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/create_account' do
    erb :create_account
  end

  post '/create_account_post' do
    redirect '/account_created' 
  end

  get '/account_created' do
    'Account created successfully!'
  end





run! if app_file == $0

end
