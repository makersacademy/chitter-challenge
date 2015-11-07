require_relative 'base_controller'

module Routes

  class MakerController < BaseController

    get '/signup' do
      erb :'maker/signup'
    end

    post '/signup-details' do
      @maker = Maker.create(name: params[:name], email: params[:email], username: params[:username], password_hash: params[:password], password_hash_confirmation: params[:password_confirmation])
      if @maker.save
        session[:maker_id] = @maker.id
        redirect to '/home'
      else
        flash.now[:email_taken] = @maker.errors[:email].first
        flash.now[:username_taken] = @maker.errors[:username].first
        erb :'maker/signup'
      end
    end

    get '/home' do
      erb :'maker/home'
    end

    run! if app_file == $PROGRAM_NAME
  end

end
