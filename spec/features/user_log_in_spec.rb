feature 'user logs in' do
  let!(:user) { User.create(username: 'test', mail: 'test@test.com', password: '123')}
  scenario 'to see greeting with username' do
    visit '/'
    click_on 'Log In'
    fill_in :username, with: 'test'
    fill_in :password, with: '123'
    click_on 'Submit'
    expect(page).to have_content "post a peep test"
  end
end
