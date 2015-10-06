module Chitter

  module Routes

    class HomePage < App

      #Home Page
      get '/' do
        @peeps = Peep.all
        erb :index
      end

      #User Registration
      post '/user/sign-up' do
        @user = User.create(email: params[:email], password: params[:password],
        name: params[:name], username: params[:username])
        if @user.save
          session[:user_id] = @user.id
          redirect to '/'
        else
          flash[:errors] = @user.errors.full_messages
          redirect to '/'
        end
      end

    end

  end

end
