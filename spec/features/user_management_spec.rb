feature 'User sign up' do

  User.create(email: 'ichnusa@sardinia.com',
              password: '123456',
              username: 'SardiniaAwesome')

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by (1)
    expect(page).to have_content('Welcome, SardiniaAwesome')
    expect(User.first.username).to eq('SardiniaAwesome')
  end

  User.create(email: 'ichnusa@sardinia.com',
              password: '123456',
              username: 'SardiniaAwesome')

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  def sign_up(email: 'ichnusa@sardinia.com',
              username: 'SardiniaAwesome',
              password: '123456')
    visit '/index'
    expect(page.status_code).to eq(200)
    fill_in :sign_up_email, with: email
    fill_in :sign_up_username, with: username
    fill_in :sign_up_password, with: password
    click_button 'Sign up'
  end



end