class Chitter < Sinatra::Base

  get '/sessions/new' do
    flash[:notice] = nil
    erb :"sessions/new"
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:errors] = ["The email or password is incorrect"]

    end
  end

  delete '/sessions' do
    session.clear
    flash[:notice] = "Good bye!"
    redirect('/')
  end

end