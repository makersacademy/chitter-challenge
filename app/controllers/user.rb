require_relative 'base'

module Application
  module Routes
    class Users < Base

      get '/users/new' do
        @user = User.new
        erb :'/users/new'
      end

      post '/users' do
        params.has_value?('') || params.values.grep(/\s/).empty? ?
          (redirect '/users/new') :
          @user = User.create(
                    email: params[:email], password: params[:password],
                    name: params[:name], username: params[:username]
                  )
          if @user.save
            session[:user_id] = @user.id
            redirect '/posts/new'
          else
            erb :'/users/new'
          end

      end

    end
  end
end

