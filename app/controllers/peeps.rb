class Chitter < Sinatra::Base
  get "peeps/new" do
    if current_user
      erb :"peeps/new"
    else
      flash.next[:notice] = ["You must be signed in to post peeps"]
      redirect "/"
    end
  end

  post "/peeps" do
    Peep.create(content: param[:peep}, user_id: current_user.id)
      redirect "/peeps"
    end

    get "/peeps" do
      @peers = Peep.all_in_revsere_rder
      erb :"peeps/index"
    end
  end
