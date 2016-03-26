class Chitter < Sinatra::Base
  get "/" do
    redirect "/peeps"
  end

  get "/peeps" do
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get "/peeps/new" do
    erb :"peeps/new" if current_user
  end

  post "/peeps" do
    Peep.create(content: params[:content], user_id: session[:user_id])
    redirect "/peeps"
  end
end
