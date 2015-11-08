require_relative 'base_controller'

module Routes

  class MakerController < BaseController

    get '/signup' do
      @maker = Maker.new
      erb :'maker/signup'
    end

    post '/signup-details' do
      @maker = Maker.create(name: params[:name],
                    email: params[:email],
                    username: params[:username],
                    password_hash: params[:password],
                    password_hash_confirmation: params[:password_confirmation])
      if @maker.save
        session[:maker_id] = @maker.id
        redirect to '/home'
      else
        flash.now[:name_error] = @maker.errors[:name].first
        flash.now[:email_error] = @maker.errors[:email].first
        flash.now[:username_error] = @maker.errors[:username].first
        flash.now[:password_error] = @maker.errors[:password_hash].first
        flash.now[:cfm_error] = @maker.errors[:password_hash_confirmation].first
        erb :'maker/signup'
      end
    end

    get '/home' do
      erb :'maker/home'
    end

    get '/login' do
      erb :'maker/login'
    end

    post '/login-details' do
      @maker = Maker.authenticate(params[:username], params[:password])
      if @maker
        session[:maker_id] = @maker.id
        redirect to '/home'
      else
        flash.now[:login_error] = 'The username or password is incorrect'
        erb :'maker/login'
      end
    end

    run! if app_file == $PROGRAM_NAME
  end
end
