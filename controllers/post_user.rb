class Chittter < Sinatra::Base

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation],
                       name: params[:name],
                       username: params[:username])
    if user.save
      session[:username] = params[:name]
      redirect to('/')
    else
      flash[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end

end
