
feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up user }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, sam@makersacademy.com')
    expect(User.first.email).to eq('sam@makersacademy.com')
  end

  # def sign_up user
  #     visit('/users/new')
  #     fill_in :email, with: user.email
  #     fill_in :password, with: user.password
  #     fill_in :password_confirmation, with: user.password_confirmation
  #     click_button 'Sign up'
  # end

end