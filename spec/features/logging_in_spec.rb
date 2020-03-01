feature 'logging in' do
  scenario 'from home' do
    User.create(name: 'Peter Pan', username: 'peterpan', email: 'p@p.com', password: 'password', joined: Time.now)
    visit '/'
    click_on 'new-session'

    fill_in 'username', with: 'peterpan'
    fill_in 'password', with: 'password'

    click_on 'log-in-form'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'peterpan'
    expect(page).to have_content 'Log Out'
    expect(page).not_to have_content 'Sign Up'
    expect(page).not_to have_content 'Log In'

  end
end