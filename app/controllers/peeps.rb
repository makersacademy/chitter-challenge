class Chitter < Sinatra::Base
  get "/" do
    redirect "/peeps"
  end

  get "/peeps" do
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get "/peeps/new" do
    if current_user
      erb :"peeps/new"
    end
  end

  post "/peeps" do
    Peep.create(content: params[:content])
    redirect "/peeps"
  end
end
