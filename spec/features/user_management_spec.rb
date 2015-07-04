feature 'User sign up' do

  User.create(email: 'ichnusa@sardinia.com',
              password: '123456',
              username: 'SardiniaAwesome')

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by (1)
    expect(page).to have_content('Welcome, SardiniaAwesome')
    expect(User.first.username).to eq('SardiniaAwesome')
  end

  def sign_up(email: 'ichnusa@sardinia.com',
            password: '123456')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end



end