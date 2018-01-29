
module SessionHelpers

  def sign_up(email: 'reena@example.com', password: 'password12', password_confirmation: 'password12',
                user_id: 'reena', user_name: 'Reena Sharma')
    visit('/users/new')
    expect(page.status_code).to eq 200
    fill_in :user_id, with: user_id
    fill_in :user_name, with: user_name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit('/sessions/new')
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
