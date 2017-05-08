class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  post '/peeps' do
    peep = Peep.first_or_create(comment: params[:comment],
                       created_at: Time.now,
                       user: current_user)
    current_user.peeps << peep
    current_user.save
    redirect to '/peeps'
  end

end
