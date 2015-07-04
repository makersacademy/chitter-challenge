feature 'User\'s' do

  scenario 'can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Triffanys101')
    expect(User.first.username).to eq('Triffanys101')
  end

  def sign_up(email: 'triffanys@example.com',
              password: 'princess',
              username: 'Triffanys101')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, with: username
    fill_in :email,    with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end
end