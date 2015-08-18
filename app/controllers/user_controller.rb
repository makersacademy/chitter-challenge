module TheApp

  module Routes

    class UserController < Base
      PERMITTED_PARAMS = [:email, :username, :name, :password, :password_confirmation]

      before do
        params.each do |k, v|
          self.class.send(:define_method, k){v} if PERMITTED_PARAMS.include?(k.to_sym)
          # instance_variable_set("@#{k}", v)
        end
      end

      get '/users/new' do
        erb :'/users/new'
      end

      post '/users/new' do
        @user = create_user(params)
        if @user.save
          session[:user_id] = @user.id
          redirect to('/peeps')
        else
          flash.now[:errors] = @user.errors.full_messages
          erb :'/users/new'
        end
      end

      def create_user(params)
      User.new(email: email,
              name: name,
              password: password,
              username: username,
              password_confirmation: password_confirmation)

      end

    end

  end

end

