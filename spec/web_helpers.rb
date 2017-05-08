def sign_up
    visit '/user/new'
    fill_in 'username', with: 'axcochrane' 
    fill_in 'password', with: 'test123' 
    click_on 'Sign Up!'
end