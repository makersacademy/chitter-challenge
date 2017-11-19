class App < Sinatra::Base
  get '/peeps' do
    peeps = Peep.all.sort { |a, b| b.created_at <=> a.created_at }
      .first(maxpeeps)
    erb(:'peeps/peeps', locals: { peeps: peeps })
  end

  get '/peeps/new' do
    current_user ? erb(:'peeps/new') : status(401)
  end
  
  post '/peeps' do
    peep = Peep.new(content: params[:content], poster_id: session[:user_id])
    if peep.save
      redirect('/peeps')
    else
      flash.now[:errors] = "Peep cannot be blank"
      erb(:'peeps/new')
    end
  end
end
