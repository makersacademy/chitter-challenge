module SessionHelpers
  def sign_up
    visit '/user/new'
    fill_in(:name, with: 'Maker Makerson')
    fill_in(:email, with: 'maker@makerson.com')
    fill_in(:username, with: 'makermakerson')
    fill_in(:password, with: 'maker123')
    fill_in(:password_confirmation, with: 'maker123')
    click_button('Sign up')
  end

  def sign_up_2
    visit '/user/new'
    fill_in(:name, with: 'Other Maker')
    fill_in(:email, with: 'other@maker.com')
    fill_in(:username, with: 'other_maker')
    fill_in(:password, with: 'other123')
    fill_in(:password_confirmation, with: 'other123')
    click_button('Sign up')
  end

  def log_in
    visit '/sessions/new'
    fill_in(:email, with: 'maker@makerson.com')
    fill_in(:password, with: 'maker123')
    click_button('Log in')
  end

  def log_in_2
    visit '/sessions/new'
    fill_in(:email, with: 'other@maker.com')
    fill_in(:password, with: 'other123')
    click_button('Log in')
  end

  def log_out
    click_button('Log out')
  end

  def post_message
    visit '/peeps'
    fill_in(:message, with: 'My first peep')
    click_button('Peep!')
  end

end
