require 'warden'

Warden::Manager do |config|
  config.serialize_into_session{ |user| user.id }
  config.serialize_from_session{ |id| User.get(id) }

  config.scope_defaults :default,
    strategies: [:password],
    action: '/log-in'
  config.failure_app = self
end

Warden::Manager.before_failure do |env,opts|
  env['REQUEST_METHOD'] = 'POST'
end

Warden::Strategies.add(:password) do
  def valid?
    params['user']['username'] && params['user']['password']
  end
  def authenticate!
    user = User.first(username: params['user']['username'])
    if user.nil?
      throw(:warden, message: "The username you entered does not exist.")
    elsif user.authenticate(params['user']['password'])
      success!(user)
    else
      throw(:warden, message: "The username and password combination")
    end
  end
end
