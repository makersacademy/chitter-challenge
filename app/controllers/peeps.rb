class Chitter < Sinatra::Base

  get '/peeps' do
    erb :'peeps/index'
  end

  get '/peeps/new' do
    if session[:user_id].nil?
      flash.now[:notice] = "You must be logged in to post a peep"
      redirect '/peeps'
    end
    erb :'peeps/new'
  end

  post '/peeps' do
    if params[:peep_content] != ""
      peep = Peep.new(content: params[:peep_content], user_id: current_user.id)
      tags = params[:tags]
      tags.split(" ").each do |tag|
        search = User.first(:username => tag)
        if search
          email(search.email, "Chitter: #{search.username} tagged you in a peep!", "Go to Chitter to see it.")
        end
        tag  = Tag.first_or_create(name: tag)
        peep.tags << tag
      end
      peep.save
      redirect to('/peeps')
    else
      flash.now[:notice] = "Please enter a message for your peep"
      erb :'/peeps/new'
    end
  end

end
