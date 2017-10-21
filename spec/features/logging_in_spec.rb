feature 'Logging into Chitter' do

  let(:user) { User.create(name: 'Ainsley', email: 'no@email.com', password: 'password', handle: '#ainsley') }

  scenario 'I can log into Chitter' do
    visit '/'
    fill_in :email, with: user.email
    fill_in :password, with: 'password'
    click_button 'Log in'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, Ainsley'
  end

end
