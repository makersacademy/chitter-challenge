class Chitter < Sinatra::Base
  get "/peeps" do
    @peeps = Peep.all
    erb(:"peep/index")
  end

  get "/peeps/new" do
    erb(:"peep/new")
  end

  post "/peeps" do
    Peep.create(text: params[:text], timestamp: Time.now)
    redirect("/peeps")
  end
end
