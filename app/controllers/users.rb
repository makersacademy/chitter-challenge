class ChitterChallenge < Sinatra::Base

  get "/users/new" do
    erb :"users/new"
  end

  post "/users" do
    user = User.create(name: params[:name], username: params[:username],
                       email: params[:email], password: params[:password])
    if user.id.nil?
      flash[:errors] = user.errors.full_messages
      redirect to "/users/new"
    else
      session[:user_id] = user.id
      redirect to "/peeps"
    end
  end
end
