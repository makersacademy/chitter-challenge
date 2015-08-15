module Chitter
  module Routes
    class Users < Base
      get '/users/sign_up' do
        erb :'users/sign_up'
      end

      post '/users/sign_up' do
        user = User.create(email: params[:email],
                           name: params[:name],
                           username: params[:username],
                           password: params[:password],
                           password_confirmation: params[:password_confirmation])
        redirect '/'
      end
    end
  end
end