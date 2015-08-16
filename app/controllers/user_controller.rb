module TheApp

  module Routes

    class UserController < Base
      get '/users/new' do
        erb :'/users/new'
      end

      post '/users/new' do
        @user = User.new(email: params[:email],
                         name: params[:name],
                         password: params[:password],
                         username: params[:username],
                         password_confirmation: params[:password_confirmation])

        if @user.save
          session[:user_id] = @user.id
          redirect to('/peeps')
        else
          flash.now[:errors] = @user.errors.full_messages
          erb :'/users/new'
        end
      end
    end

  end

end

