feature 'my peeps' do
  scenario 'so that user can click see only their own peeps' do
    visit('/login')
    fill_in 'username', with: 'Jedward'
    fill_in 'email', with: 'edward@makers.com'
    click_button 'Sign in'
    visit('/mypeeps')
    expect(page.status_code).to eq 200
  end

  scenario 'so that user can create account on sign up page' do
    visit('/login')
    fill_in 'username', with: 'Jedward'
    fill_in 'email', with: 'edward@makers.com'
    click_button 'Sign in'
    # instance of user not being created so not proceeding to next page
    click_button 'Peep!'
    fill_in 'peep', with: 'latest'
    click_button 'my peeps'
    expect(page).to have_content('latest')
  end
end
