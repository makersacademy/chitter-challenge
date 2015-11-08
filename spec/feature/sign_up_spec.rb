# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do
  scenario 'user input email, password, name and user name' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, amy@awesome.com')
    expect(User.first.email).to eq 'amy@awesome.com'
  end

  scenario 'with a password that does not match'do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Password does not match the confirmation"
  end

  def sign_up(email:'amy@awesome.com', password:'apple', password_confirmation:'apple')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button('Sign up')
  end
end
