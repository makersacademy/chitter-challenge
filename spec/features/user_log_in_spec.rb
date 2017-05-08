feature 'user log up' do
  scenario 'existing user can log in to the website' do
    sign_up    
    log_in
    expect(page).to have_content 'Hey axcochrane! You have logged in'
  end
end