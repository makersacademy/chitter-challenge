class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new
    user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save # #save returns true/false depending on whether the model is successfully saved to the database.
      session[:user_id] = user.id
      redirect('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'users/new'
    end
  end

end
