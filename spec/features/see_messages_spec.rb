feature 'See messages' do
  before(:each) do
    user = User.create(username: 'user01',
                email: 'user01@test.com',
                password: 'test1234')
    Message.create(user_id: user.id,
                    message: 'My first peep')
  end

  scenario 'on homepage' do

    visit '/'
    expect(page).to have_content('My first peep')

  end

end
