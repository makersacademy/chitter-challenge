class Chitter < Sinatra::Base
  get "/peeps" do
    redirect("/")
  end

  get "/peeps/new" do
    @text = params[:text]
    erb(:"peep/new")
  end

  post "/peeps" do
    peep = Peep.create(
      text: params[:text],
      timestamp: Time.now,
      user: current_user
    )

    if peep.id
      redirect("/peeps")
    else
      flash.next[:error] = peep.errors.full_messages
      redirect("/peeps/new")
    end
  end
end
