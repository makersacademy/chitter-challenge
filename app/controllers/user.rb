require_relative 'base'

module Application
  module Routes
    class Users < Base

      get '/users/new' do
        @user = User.new
        erb :'/users/new'
      end

      post '/users' do
        @user = User.create(email: params[:email], password: params[:password],
                              name: params[:name], username: params[:username],password_confirmation: params[:password_confirmation]
                              )
        redirect '/users/new' if params.has_value?('') #|| params.values.grep(/\s/).empty? == false
        if @user.save
          session[:user_id] = @user.id
          redirect '/posts/new'
        else
          flash.now[:errors] = @user.errors.full_messages
          erb :'/users/new'
        end

      end

    end
  end
end

