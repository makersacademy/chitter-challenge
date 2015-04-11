class Chitter

  get '/:username' do
    user = User.first(username: params[:username])
    if user
      @peeps = Peep.all user: user, order: [:date_time.desc]
      erb :profile
    else
      erb :error
    end
  end

end