feature 'User signs up' do

  def sign_up email = 'sanjsanj@hotmail.com', password = 'password'
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end

  scenario 'when being a new user visiting Chitter' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, sanjsanj@hotmail.com'
    expect(User.first.email).to eq 'sanjsanj@hotmail.com'
  end

end
