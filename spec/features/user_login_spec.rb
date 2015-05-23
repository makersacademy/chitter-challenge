require_relative 'helpers'

feature 'User logs in' do
  before(:each) do
    User.create(username: 'user01',
                email: 'user01@test.com',
                password: 'test1234')
  end

  scenario 'successfully' do
    visit '/'
    expect(page).not_to have_content('user01')
    login('user01', 'test1234')
    expect(page).to have_content('user01')
  end

  scenario 'unsuccessfully (unknown username)' do
    visit '/'
    expect(page).not_to have_content('user01')
    login('user00', 'test1234')
    expect(page).to have_content('The email or password is incorrect')
  end

  scenario 'unsuccessfully (wrong password)' do
    visit '/'
    expect(page).not_to have_content('user01')
    login('user01', 'incorrect')
    expect(page).to have_content('The email or password is incorrect')
  end
end
