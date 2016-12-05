module Helpers
  def sign_up
    visit '/sign_up'
    fill_in 'name', with: "Maker Star"
    fill_in 'email', with: "maker@gmail.com"
    fill_in 'username', with: "maker"
    fill_in 'password', with: "12345"
    click_button 'Sign up'
  end

  def wrong_email_sign_up
    visit '/sign_up'
    fill_in 'name', with: "Maker Star"
    fill_in 'email', with: "ma"
    fill_in 'username', with: "maker"
    fill_in 'password', with: "12345"
    click_button 'Sign up'
  end

  def new_sign_up
    visit '/sign_up'
    fill_in 'name', with: "Taker Star"
    fill_in 'email', with: "Taker@gmail.com"
    fill_in 'username', with: "taker"
    fill_in 'password', with: "12345"
    click_button 'Sign up'
  end

  def log_in
    visit '/log_in/new'
    fill_in 'username', with: 'maker'
    fill_in 'password', with: '12345'
    click_button('Log in')
  end

  def log_in_2
    visit '/log_in/new'
    fill_in 'username', with: 'taker'
    fill_in 'password', with: '12345'
    click_button('Log in')
  end

  def peep
    visit '/peeps/new'
    fill_in 'peep' , with: "This is my first peep. And what a peep it is."
    click_button 'Peep'
  end

  def peep_2
    visit '/peeps/new'
    fill_in 'peep' , with: "This is my second peep. And it's even better."
    click_button 'Peep'
  end
end
