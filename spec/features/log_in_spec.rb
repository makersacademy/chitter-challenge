feature "login"  do

  scenario 'user successfully logs in' do

    visit('/login')
    fill_in :email_address, with: "j_schmoe@gmail.com"
    fill_in :password, with: "7gyhd88gg4"
    expect(page).to have_button 
    click_button 
  end

  # Feature not yet implemented
  # scenario 'user enters wrong log-in details' do

  #   visit('/login')
  #   fill_in :email_address, with: "j_schmoe@gmail.com"
  #   fill_in :password, with: "wrongpass"
  #   expect(page).to have_button 
  #   click_button 
  #   expect(page).to have_content "Login failed"
  # end

end
