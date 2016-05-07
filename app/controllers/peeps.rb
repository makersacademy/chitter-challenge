class Chitter < Sinatra::Base
  get '/' do
    redirect to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :'peeps/all'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    @peep = Peep.new(user: current_user, content: params[:content])
    if @peep.save
      flash.next[:notice] = 'Your peep has been posted!'
      redirect to '/peeps'
    else
      flash.now[:errors] = @peep.errors.full_messages
      erb :'peeps/new'
    end
  end
end
