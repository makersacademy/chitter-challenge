class Chitter < Sinatra::Base
  get "/" do
    redirect "/peeps"
  end

  get "/peeps" do
    @peeps = Peep.all.reverse
    erb :"peeps/index"
  end

  get "/peeps/new" do
    erb :"peeps/new" if current_user
  end

  post "/peeps" do
    Peep.create(content: params[:content], user_id: current_user.id)
    redirect "/peeps"
  end
end
