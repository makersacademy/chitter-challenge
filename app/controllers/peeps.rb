class Chitter < Sinatra::Base
  get "/peeps" do
    erb(:"peep/index")  
  end

  get "/peeps/new" do
    erb(:"peep/new")
  end

  post "/peeps" do
    redirect("/peeps")
  end
end
