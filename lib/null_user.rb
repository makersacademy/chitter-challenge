# frozen_string_literal: true

class NullUser
  def email
    'anonymouse'
  end

  def id; end

  def log_button
    {
      label: 'Log In',
      name: 'log-in',
      path_action: '/sessions/new'
    }
  end

  def signup
    ''
  end
end
