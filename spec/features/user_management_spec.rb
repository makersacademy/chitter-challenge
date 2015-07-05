# require './app/models/user'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, salman@test.com')
    expect(User.first.email).to eq 'salman@test.com'
  end

  def sign_up(email: 'salman@test.com', password: 'oranges!', password_confirmation: 'oranges!')
    visit '/user/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/user')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

end
