class Chitter < Sinatra::Base

  get '/user/new' do
    erb :'./user/new'
  end

  post '/user/new' do
    @user = User.new(name: params[:name],
             user_name: params[:user_name],
             email: params[:email],
             password: params[:password],
             password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.user_name
      redirect '/peep/new'
    else
      flash.next[:error_2] = "Please try again"
      redirect '/user/new'
    end
  end

  post '/user' do
    user = User.authenticate(params[:user_name], params[:password])
      if user
        session[:user_id] = user.id
        redirect '/'
      else
        flash.next[:error_1] = "Your details are incorrect, please try again or sign up"
        redirect '/session/new'
      end
  end


end
