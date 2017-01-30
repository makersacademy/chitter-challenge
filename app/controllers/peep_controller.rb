class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:'/peeps/index')
  end

  post '/peeps' do
    @peep = Peep.create(content: params[:comment], user_id: current_user.id)
    if @peep.save
      redirect to('/')
    else
      p flash.now[:errors] = @peep.errors.full_messages
      erb(:'/peeps/index')
    end
  end

end
