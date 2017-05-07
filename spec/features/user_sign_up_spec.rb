feature 'user sign up' do
  scenario 'user can regsister as a new user' do
    visit '/user/new'
    fill_in 'username', with: 'axcochrane' 
    fill_in 'password', with: 'test123' 
    click_on 'Sign Up!'
    expect(page).to have_content 'Hi axcochrane! You have successfully signed up!'
  end
end