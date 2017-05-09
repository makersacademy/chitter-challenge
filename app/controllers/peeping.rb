class Chitter < Sinatra::Base
  post '/comment' do
    @peep = Peep.current
    Comment.create(body: params[:comment], timestamp: Time.now.to_s[0, 16],
                   user_id: @user.id, peep_id: @peep.id)
    redirect "/peeps/#{@peep.id}"
  end

  post '/peep' do
    time = Time.now.to_s[0, 16]
    Peep.create(body: params[:peep], timestamp: time, user_id: @user.id)
    redirect '/home'
  end
end
