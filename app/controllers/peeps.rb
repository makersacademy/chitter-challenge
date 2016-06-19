class Chitter < Sinatra::Base
  get "/peeps" do
    redirect("/")
  end

  get "/peeps/new" do
    @text = params[:text]
    erb(:"peep/new")
  end

  post "/peeps" do
    if current_user
      peep = Peep.create(
        text: params[:text],
        timestamp: Time.now,
        user: current_user
      )
      Peep.extract_hashtags(peep)
    else
      flash[:notice] = ["You must be logged in to do that"]
    end
    redirect("/peeps")
  end
end
