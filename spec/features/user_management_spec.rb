feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, zaid@makers.com')
    expect(User.first.email).to eq('zaid@makers.com')
  end

  def sign_up(email: 'zaid@makers.com', password: 'oranges!', name: 'Zaid Lahham', user_name: 'zaid23')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :name,    with: name
    fill_in :user_name, with: user_name
    click_button 'Sign up'
  end

end
