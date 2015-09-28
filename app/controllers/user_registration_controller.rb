module Chitter

  module Routes

    class UserRegistration < Sinatra::Base

      get '/' do
        erb :index
      end

      post '/user/sign-up' do
        #we initialize the object without saving it.
        @user = User.create(email: params[:email], password: params[:password],
        name: params[:name], username: params[:username])
        if @user.save #return true or false if successfuly saved
          session[:user_id] = @user.id
          redirect :'/peeps'
        else
          flash.now[:errors] = @user.errors.full_messages
          erb :index
        end
      end

    end

  end

end
