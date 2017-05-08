feature 'user log up' do
  scenario 'user can log in to the website' do
    sign_up    
    expect(page).to have_content 'Hi axcochrane! You have successfully signed up!'
  end
end