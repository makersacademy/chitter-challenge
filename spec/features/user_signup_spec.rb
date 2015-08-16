feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Christopher Alcock')
    expect(User.first.realname).to eq('Christopher Alcock')
  end

  def sign_up(email: 'christopher.alcock@gmail.com',
              password: 'makers!',
              username: 'chrisalcockdev',
              realname: 'Christopher Alcock')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :username, with: username
    fill_in :realname, with: realname

    click_button 'Sign up'
  end

end
