require 'sinatra/flash'

class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    params[:bio] ||= ""
    params[:avatar] ||= ""
    @user = User.create(email: params[:email], handle: params[:handle],
                    bio: params[:bio], avatar: params[:avatar], password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/:id' do
    @user = User.first(id: params[:id])
    @peeps = Peep.all(user_id: @user.id)
    erb :'users/profile'
  end

  post '/users' do
    if params[:id] != ""
      redirect('/users/' + params[:id])
    else
      redirect '/peeps'
    end
  end

end
