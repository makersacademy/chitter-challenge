class Fitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name],
                user_name: params[:user_name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/posts'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new', :layout => :'users/layout'
    end
  end
end
