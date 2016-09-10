class Chitter < Sinatra::Base

  get "/" do
    redirect "/peeps"
  end

  get "/peeps" do
    @peeps = Peep.all
    erb :"peeps/index"
  end

  post "/peeps" do
    if current_user
      peep = Peep.new(peeptext: params[:peepbox])
      peep.user = current_user
      peep.save
      redirect "/peeps"
    else
      flash[:errors] = ["You need to log in to peep"]
      redirect "/peeps"
    end
  end
end
