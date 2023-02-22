feature 'user can log out' do 
  scenario 'user successfully logs out' do 
    # Logs in
    visit('/login')
    fill_in :email_address, with: "j_schmoe@gmail.com"
    fill_in :password, with: "7gyhd88gg4"
    expect(page).to have_button 
    click_button 

    visit('/')
    expect(page).to have_button
    click_button

    visit('/')
    expect(page).to have_no_button
  end 

end 
