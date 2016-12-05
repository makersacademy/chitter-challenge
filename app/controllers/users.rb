class ChitterApp < Sinatra::Base
  get "/users/new" do
    @user = User.new
    erb :"users/new"
  end

  post "/users" do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to("/peeps")
    else
      flash.now[:notice] = ["Password and confirmation password do not match"]
      erb :"users/new"
    end
  end

end
