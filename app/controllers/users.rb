class Chitter < Sinatra::Base
  get "/users/new" do
    erb(:"user/new")
  end

  post "/users" do
    user = User.create(user_params)

    if user.id
      session[:user_id] = user.id
      redirect("/")
    else
      flash.next[:error] = user.errors.full_messages
      redirect("/users/new")
    end
  end

  def user_params
    allowed_params = [:email, :name, :username, :password, :password_confirm]
    params.select { |param| allowed_params.include?(param.to_sym) }
  end
end
