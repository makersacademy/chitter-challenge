feature 'User sign up' do
  scenario 'I can sign up for Chitter' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, sam@makersacademy.com')
    expect(User.first.email).to eq('sam@makersacademy.com')
  end

  def sign_up(user)
    visit '/users/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :first_name, with: user.first_name
    fill_in :last_name, with: user.last_name
    click_button 'Sign up'
  end

end
