module ChitterModule
  module Routes

    class UserController < Base

      get '/users/new' do
        erb :'users/new'
      end

      post '/users' do
        @user = User.create(email: params[:email],
                           name: params[:name],
                           user_name: params[:user_name],
                           password: params[:password],
                           password_confirmation: params[:password_confirmation])
        if @user.save
          session[:user_id] = @user.id
          redirect to('/peeps')
        else
          flash.now[:errors] = @user.errors.full_messages
          erb :'users/new'
        end
      end
    end
  end
end