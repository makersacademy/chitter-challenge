feature 'email and username unique' do 
  scenario 'raises an error if same email entered' do
    signup
    visit '/users/new'
    fill_in(:username, with: 'alexchen')
    click_on('Submit')
    expect(page).to have_content "Username/email has been taken"
  
# flash
  end 

  scenario 'raises an error if same username entered' do
    signup
    visit '/users/new'
    fill_in(:email, with: 'alex@hotmail.com')
    click_on('Submit')
    expect(page).to have_content "Username/email has been taken"
  end 

end 
