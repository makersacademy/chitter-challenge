class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :index
  end

  post '/' do
    @peep = Peep.new(content: params[:msg],
                     user: User.first(id: session[:user_id]))
    if @peep.save
      redirect to('/')
    else
      flash.now[:errors] = ['Sorry! Please sign in to Peep!']
      erb :index
    end
  end

end