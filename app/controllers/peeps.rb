class App < Sinatra::Base
  get '/peeps' do
    peeps = Peep.all.sort { |a, b| b.created_at <=> a.created_at }
    if params[:user]
      peeps = peeps.select { |peep| peep.user.handle == params[:user] } 
    end
    if params[:tag]
      peeps = peeps.select do |peep| 
        peep.tags.map { |t| t.name == params[:tag] }.any?
      end
    end
    erb(:'peeps/peeps', locals: { peeps: peeps.first(maxpeeps) })
  end

  get '/peeps/new' do
    current_user ? erb(:'peeps/new') : status(401)
  end
  
  post '/peeps' do
    peep = Peep.new(content: params[:content], poster_id: session[:user_id])
    if peep.save
      redirect('/peeps')
    else
      flash.now[:errors] = (params[:content] == "" ? 
        "Peep cannot be blank" : "Tagged user does not exist")
      erb(:'peeps/new')
    end
  end

  get '/peeps/search' do
    erb(:'peeps/search')
  end

  get '/peeps/users/:id' do |id|
    user = User.first(id: id)
    if user
      erb(:'peeps/peeps', 
          locals: { peeps: user.peeps, header: "Peeps by #{user.handle}" })
    else
      status(404)
    end
  end

  get '/peeps/:id' do |id|
    peep = Peep.first(id: id)
    if peep
      erb(:'peeps/peeps', locals: { peeps: [peep], header: "Peep #{id}" })
    else
      status(404)
    end
  end
end
