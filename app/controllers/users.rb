class Chitter < Sinatra::Base
  get "/user/new" do
    erb(:"user/new")
  end

  post "/user" do
    user = User.create(
      username: params[:username],
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirm: params[:password_confirm]
    )

    if user.id
      session[:user_id] = user.id
      redirect("/")
    else
      flash[:error] = user.errors.full_messages
      redirect("/user/new")
    end
  end

  get "/user/profile/:username" do
    user = User.first(username: params[:username])
    peeps = user ? user.peeps : []
    peep_list = partial(:"peep/peep", locals: { peeps: peeps })
    erb(:"user/profile", locals: { peep_formatted_list: peep_list, user: user })
  end
end
