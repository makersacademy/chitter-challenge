feature 'user sign up' do
  scenario 'user can regsister as a new user' do
    visit '/user/new'
    fill_in 'user_name', with: 'axcochrane' 
    fill_in 'passworth', with: 'test123' 
    click_on 'Sign Up!'
    expect(page).to include 'Hi axcochrane! You have successfully signed up!'
  end
end