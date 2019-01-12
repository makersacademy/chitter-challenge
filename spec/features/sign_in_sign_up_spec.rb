feature 'User authentication' do
  
  scenario 'page shows sign in and sign up options' do
    visit '/'
    expect(page).to have_button 'Sign in'
    expect(page).to have_button 'Sign up'
  end
  
  scenario 'user can sign up' do
    visit '/'
    click_button 'Sign up'
    fill_in :username, with: 'chitter_forever'
    fill_in :email, with: 'chitter@chittering.com'
    fill_in :password, with: 'gnirettihc123'
    click_button 'Sign up'
    expect(page).to have_content 'Hello, chitter_forever'
  end

end
