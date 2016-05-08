class ChitterChallenge < Sinatra::Base

  get "/users/new" do
    erb :"users/new"
  end

  post "/users" do
    user = User.create(name: params[:name], username: params[:username],
                       email: params[:email], password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.id.nil?
      flash[:errors] = user.errors.full_messages
      redirect to "/peeps"
    else
      session[:user_id] = user.id
      redirect to "/peeps"
    end
  end

  get "/users/password_recovery" do
    erb :"users/password_recovery"
  end

  post "/users/password" do
    user = User.first(email: params[:email])
    user.store_token if user
    flash[:errors] = ["Please check your emails"]
    redirect to "/peeps"
  end

  get "/users/password_reset" do
    user = User.find_by_token(params[:token])
    if user
      erb :"users/password_reset"
    else
      flash[:errors] = ["Invalid password token"]
      redirect to "/peeps"
    end
  end

  patch "/users" do
    user = User.find_by_token(params[:token])
    if user.update(password: params[:password],
                   password_confirmation: params[:password_confirmation])
       redirect to "/peeps"
    else
      flash[:errors] = ["Password does not match the confirmation"]
      redirect to "/peeps"
    end
  end
end
