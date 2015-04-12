class Chitter

  get '/followed' do
    follow = Follow.all follower: current_user
    @peeps = Peep.all user: follow.followed, order: [:date_time.desc]
    erb :followed
  end

  get '/view/following' do
    @following = Follow.all follower: current_user
    erb :"follow/following"
  end

  get '/view/followers' do
    @followers = Follow.all followed: current_user
    erb :"follow/followers"
  end

  post '/follow' do
    follower = User.first(id: current_user.id)
    followed = User.first(id: params[:followed])
    Follow.create(follower: follower,
                  followed: followed)
    redirect back
  end

  post '/unfollow' do
    follower = User.first(id: current_user.id)
    followed = User.first(id: params[:followed])
    unfollow = Follow.first(follower: follower,
                            followed: followed)
    unfollow.destroy
    redirect back
  end

end