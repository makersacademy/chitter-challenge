class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :'peeps/index'
  end

  post '/peep' do
    peep = Peep.create(message: params[:message], user_id: @current_user.id)

    flash.now[:errors] = peep.errors.full_messages
    redirect to '/'
  end
end
