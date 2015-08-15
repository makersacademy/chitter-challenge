require_relative 'base'

module Application
  module Routes
    class XUser < Base

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
          session[:user_id] = @user.id if @user.save
        erb :'/users/new'

      end

    end
  end
end

