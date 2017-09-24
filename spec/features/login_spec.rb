feature 'login' do
  scenario 'so that user can click sign in on landing page' do
    visit('/')
    click_button 'Sign in'
    expect(page.status_code).to eq 200
  end

  scenario 'so that user can click sign in on landing page' do
    visit('/create')
    fill_in 'username', with: 'Jedward'
    fill_in 'email', with: 'edward@makers.com'
    click_button 'Create Account'
    expect(page).to have_content('Login completed')
    
    visit('/login')
    fill_in 'username', with: 'Jedward'
    fill_in 'email', with: 'edward@makers.com'
    click_button 'Sign in'
    expect(page).to have_content('Login completed')
  end
end
