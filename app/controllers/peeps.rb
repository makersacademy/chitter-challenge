class Chitter < Sinatra::Base
  get "/peeps" do
    redirect("/")
  end

  get "/peeps/new" do
    @text = params[:text]
    erb(:"peep/new")
  end

  post "/peeps/new" do
    peep = Peep.create(
      text: params[:text],
      timestamp: Time.now,
      user: current_user
    )

    if current_user && peep.id
      redirect("/peeps")
    else
      flash[:error] = peep.errors.full_messages
      redirect("/peeps/new")
    end
  end
end
