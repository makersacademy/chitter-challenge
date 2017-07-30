class Chitter < Sinatra::Base
  get "/peeps/new" do
    erb :'/peeps/new'
  end

  post "/peeps" do
    peep = Peep.new(content: params[:peep],
                    time: Time.now,
                    user_id: session[:user_id])
    params[:tags].split.each do |tag|
      if User.tagged(tag)
        peep.tags << Tag.first_or_create(user_id: User.tagged(tag).id)
        Notification.send(User.tagged(tag), User.get(peep.user_id))
      end
    end
    peep.save
    redirect to("/peeps")
  end

  get "/peeps" do
    @peeps = Peep.all(:order => [:time.desc])
    erb :'/peeps/index'
  end
end
