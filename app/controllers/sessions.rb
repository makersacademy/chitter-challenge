class ChitterChallenge < Sinatra::Base

  get "/sessions/logout" do
    session[:user_id] = nil
    redirect to "/users/new"
  end

  post "/sessions/login" do
    user = User.authenticate(params[:emailLogin], params[:passwordLogin])
    if user
      session[:user_id] = user.id
    else
      flash[:errors] = ["Incorrect email and password combination"]
      flash[:email] = params[:email]
    end
    redirect to "/peeps"
  end
end
