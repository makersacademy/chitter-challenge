class Chitter < Sinatra::Base
  get '/users/new' do
    erb(:'users/new')
  end

  post '/users/new' do
    user = User.new(email: params[:email],
                    name: params[:name],
                    username: params[:username],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to '/peeps/index'
    else
      flash.next[:errors] = user.errors.full_messages
      redirect to '/users/new'
    end
  end
end

