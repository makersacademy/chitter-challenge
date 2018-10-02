class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :index
  end

  post '/peeps' do
    @user = current_user
    message = params[:peep]
    Peep.create(message: message, user_id: @user.id)

    mentions = Peep.find_mentions(message)
    unless !mentions.empty?
      mentions.each do |mention|
        User.all.each do |user|
          SendTagAlert.call(user.email) if mention == user.username
        end
      end
    end
    redirect '/'
  end

  get '/reply/:id/new' do
    @peep_id = params[:id]
    erb :reply
  end

  post '/reply/:id/new' do
    @user = current_user
    @peep_id = params[:id]
    Reply.create(message: params[:reply], user_id: @user.id, peep_id: @peep_id)
    redirect '/'
  end
end
