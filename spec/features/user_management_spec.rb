feature 'User sign up' do

  def sign_up(email: 'chris@example.com',
              username: 'chweeks',
              password: 'apples',
              password_confirmation: 'apples')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, chweeks')
    expect(User.first.email).to eq('chris@example.com')
  end

  scenario 'requires a matching confirmation password' do
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User,:count)
  end

  scenario 'with a password that does not match' do
  expect {sign_up(password_confirmation: 'wrong')}.not_to change(User,:count)
  expect(current_path).to eq('/users')
  expect(page).to have_content 'Password and confirmation password do not match'
end

end
