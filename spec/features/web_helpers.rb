def login 
    visit '/log_in'
    fill_in 'username', with: 'Test User'
    fill_in 'password', with: 'password123'
    click_on 'Log in'
end 