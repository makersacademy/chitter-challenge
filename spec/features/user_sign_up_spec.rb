feature 'user sign up' do
  # let!(:user) { User.create(username: 'test', mail: 'test@test.com', password: '123')}

  scenario 'user sign up and see greeting with username' do
    visit '/'
    click_on 'Sign Up'
    fill_in :username, with: 'user1'
    fill_in :mail, with: 'user@mail.com'
    fill_in :password, with: 'password'
    click_on 'Submit'
    expect(page).to have_content "post a peep user1"
  end
end
