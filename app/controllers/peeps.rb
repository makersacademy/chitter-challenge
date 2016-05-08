class ChitterChallenge < Sinatra::Base

  get "/peeps" do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :"peeps/index"
  end

  get "/peeps/new" do
    erb :"peeps/new"
  end

  post "/peeps" do
    peep = Peep.create(user: current_user,
                       message: params[:message],
                       created_at: Time.now)
    if peep.id.nil?
      flash[:errors] = peep.errors.full_messages
      redirect to "/peeps/new"
    else
      redirect to "/peeps"
    end
  end
end
