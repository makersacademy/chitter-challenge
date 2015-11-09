module Helpers

  def sign_up
    visit '/'
    click_button 'Sign up'
    fill_in :name, with: 'Anderson'
    fill_in :username, with: 'Anderson_Silva_123'
    fill_in :email, with: 'anderson_is_king@email.com'
    fill_in :password, with: 'MMAbjj'
    click_button 'Confirm sign up'
  end

  def sign_up_2
    visit '/'
    click_button 'Sign up'
    fill_in :name, with: 'Anderson'
    fill_in :username, with: 'Anderson_Silva_123'
    fill_in :email, with: 'anderson_is_queen@email.com'
    fill_in :password, with: 'MMAbjj'
    click_button 'Confirm sign up'
  end

  def sign_in(email:, password:)
    visit '/'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
