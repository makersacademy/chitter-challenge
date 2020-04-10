feature 'makers can log out to chitter' do
  scenario 'successful log out when logged in' do
    Peep.create('My first peep', Time.now)
    Peep.create('My second peep', Time.now)
    sign_up
    click_button 'Log out'
    expect(page).to have_content 'Not currently logged in'
  end
end
