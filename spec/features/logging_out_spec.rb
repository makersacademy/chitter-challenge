feature 'User can log out' do

  before(:each) do
    User.create(email: 'alice@example.com',
                password: 'aliali',
                username: 'useruser',
                name: 'alice')
  end

  scenario 'after being logged in' do
    sign_in('alice@example.com')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(current_path).to eq('/')
  end

  scenario 'only if logged in' do
    expect(page).to_not have_button('Sign out')
  end

end


def sign_in (email)
  visit '/sessions/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :password, with: 'aliali'
  click_button 'Sign in'
end