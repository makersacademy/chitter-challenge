class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :index
  end

  post '/peeps' do
    @user = current_user
    Peep.create(message: params[:peep], user_id: @user.id)
    User.all.each do |user|
      if params[:peep].include?(user.username)
        SendTagAlert.call(user.email)
      end
    end
    redirect '/'
  end
end
