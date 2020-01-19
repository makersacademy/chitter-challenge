feature 'user login' do
  scenario 'user is able to login if they have previously registered' do
    visit '/'
    fill_in :current_username, with: 'John'
    click_on 'Register'
    fill_in :current_username, with: 'John'
    click_on 'Login'
    expect(page).to have_content 'Logged in as John'
  end
end

feature 'user login' do
  scenario 'user is not able to login if they have not previously registered' do
    visit '/'
    fill_in :current_username, with: 'John'
    click_on 'Register'
    fill_in :current_username, with: 'Mike'
    click_on 'Login'
    expect(page).to have_content 'Please log in to send peeps'
  end
end