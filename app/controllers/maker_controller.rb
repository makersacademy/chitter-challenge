require_relative 'base_controller'

module Routes

  class MakerController < BaseController

    get '/signup' do
      erb :'maker/signup'
    end

    post '/signup-details' do
      maker = Maker.create(name: params[:name], email: params[:email], username: params[:username], password_hash: params[:password], password_hash_confirmation: params[:password_confirmation])
      session[:maker_id] = maker.id
      redirect to '/home'
    end

    get '/home' do
      erb :'maker/home'
    end

    run! if app_file == $PROGRAM_NAME
  end

end
