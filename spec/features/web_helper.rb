def login_steps
    visit('/')
    fill_in :name, with "Maria"
    fill_in :email, with "test@test.com"
    fill_in :password, with "12345"
    click_button 'Submit'
end

