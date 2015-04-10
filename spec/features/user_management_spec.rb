feature 'User signs up' do

  scenario 'when a new user visits the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to blabber!
                                  Are you ready to blabb?!!!')
    expect(User.first.email).to eq('test@blabber.com')
  end

  def sign_up(name = 'aaa',
              username = 'ccc',
              email = 'test@blabber.com',
              password = 'ddd')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end
end