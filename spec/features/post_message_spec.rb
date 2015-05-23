feature 'User peeps' do
  before(:each) do
    User.create(username: 'user01',
                email: 'user01@test.com',
                password: 'test1234')
  end

  scenario 'successfully' do
    login('user01', 'test1234')
    fill_in('message', with: 'My first peep')
    click_button('Peep!')
    expect(page).to have_content('Your peep was sent successfully!')
  end

  scenario 'unsuccessfully (too long)' do
    message = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\
               Aenean commodo ligula eget dolor. Aenean massa. Cum sociis\
               natoque penatibus et magnis dis parturient montes'

    login('user01', 'test1234')
    fill_in('message', with: message)
    click_button('Peep!')
    expect(page).to have_content('Message must be at most 140 characters long')
  end

  scenario 'unlogged user should not see form' do
    visit('/')
    expect(page).to_not have_content('Write your peep here (140 chars max)')
  end
end
