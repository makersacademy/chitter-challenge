feature 'Log in' do
  before(:each) do
    User.create(name: 'Test', username: 'some_name', email: 'dsadsa@google.com', password: '123456789')
    visit '/'
    click_button 'login'
    expect(page).to have_content "Log in section"
  end
  
  scenario 'User can log in with correct pass' do
    fill_in "user",	with: "some_name" 
    fill_in "pass",	with: "123456789"
    click_button "Log in"
    expect(page).to have_content "Welcome some_name"
  end

  scenario 'User sees an error for bad username' do
    fill_in "user",	with: "some_other_name" 
    fill_in "pass",	with: "123456789"
    click_button "Log in"
    expect(page).not_to have_content "Welcome some_name"
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'User sees an error for bad password' do
    fill_in "user",	with: "some_name" 
    fill_in "pass",	with: "123456dsasa789"
    click_button "Log in"
    expect(page).not_to have_content "Welcome some_name"
    expect(page).to have_content 'Please check your email or password'
  end
end