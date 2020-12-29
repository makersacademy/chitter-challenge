module Helpers

  def sign_in(user)
    visit '/peeps'
    click_button('Sign in')
    fill_in(:email, with: user.email)
    fill_in(:password, with: user.password)
    click_button('Sign in')
  end

  def sign_up(user)
    visit '/peeps'
    click_button('Sign up')
    fill_in(:email, with: user.email)
    fill_in(:password, with: user.password)
    fill_in(:name, with: user.name)
    click_button('Submit')
  end

  def add_peep(peep)
    click_button('Add Peep')
    fill_in(:message_content, with: peep.message_content)
    click_button 'Submit'
  end
end
