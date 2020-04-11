feature 'makers can log out to chitter' do
  scenario 'successful log out when logged in' do
    maker = Maker.create('Su', 'Fox', 'there@here.com', '1234')
    Peep.create('My first peep', Time.now, maker.id)
    Peep.create('My second peep', Time.now, maker.id)
    sign_up
    click_button 'Log out'
    expect(page).to have_content 'Not currently logged in'
  end
end
