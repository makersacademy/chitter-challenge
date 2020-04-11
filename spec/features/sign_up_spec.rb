feature 'you can sign up to chitter' do
  scenario 'I should be notified when I have successfully signed up' do
    maker = Maker.create('Su', 'Fox', 'there@here.com', '1234')
    Peep.create('My first peep', Time.now, maker.id)
    Peep.create('My second peep', Time.now, maker.id)
    
    visit '/users/new'
    fill_in 'name', with: 'Phil'
    fill_in 'username', with: 'Squirrel'
    fill_in 'email', with: 'here@there.com'
    fill_in 'password', with: '1234'
    click_button 'Submit'
    expect(page).to have_content 'Hello Squirrel!'
  end
end
