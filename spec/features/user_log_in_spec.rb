feature 'user log up' do
  scenario 'user can log in to the website' do
    sign_up    
    visit 'user/login'
    fill_in 'username', with: 'axcochrane'
    fill_in 'password', with: 'test123'
    click_on 'Log in!'
    expect(page).to have_content 'Hey axcochrane! You have logged in!'
  end
end