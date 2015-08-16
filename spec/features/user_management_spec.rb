feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, zaid@makers.com')
    expect(User.first.email).to eq('zaid@makers.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'zaid@makers.com',
              password: '12345678',
              password_confirmation: '12345678',
              name: 'Zaid Lahham',
              user_name: 'zaid23')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :name,    with: name
    fill_in :user_name, with: user_name
    click_button 'Sign up'
  end

end
