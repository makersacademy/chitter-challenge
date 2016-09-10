class Chitter < Sinatra::Base

  get "/peeps" do
    erb :"peeps/index"
  end

  post "peeps" do

  end
end
