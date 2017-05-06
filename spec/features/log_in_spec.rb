feature 'user can log in' do
  scenario 'user enters correct login details' do
    sign_up
    visit '/log-in'
    fill_in 'email_address', with: 'test@example.com'
    fill_in 'password', with: 's3cr3t'
    click_on 'Log In'
    expect(site_address).to be '/chitter-newsfeed'
    expect(page).to have_content 'Log in successful'
  end
end
