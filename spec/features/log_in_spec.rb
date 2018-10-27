feature do

  before do
    User.add(username: 'Becka', email: 'notarealemail12345@hotmail.co.uk', password: 'fakepassword')
  end

  scenario 'visits homepage' do
    visit '/'
    fill_in 'username', with: 'Becka'
    fill_in 'password', with: 'fakepassword'
    click_on 'log in'
    expect(page).to have_content 'Welcome back to chitter, Becka'
  end

end
