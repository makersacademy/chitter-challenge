feature 'log in as user' do
  scenario 'user logs in from index page' do
    new_user
    log_in('password')
    expect(current_path).to eq '/home'
    expect(page).to have_content("Welcome back, Guy!")
  end
  
  scenario 'user enters incorrect password' do
    new_user
    log_in('wrong password')
    expect(current_path).to eq '/'
    expect(page).to have_content("Wrong password!")
  end
end
