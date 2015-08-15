feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Teeohbee')
    expect(User.first.username).to eq('Teeohbee')
  end

  def sign_up(username: 'Teeohbee', password: 'makers', email: 'toby@example.com')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end
end
