def sign_up
    visit '/users/new'
    fill_in 'username', with: 'axcochrane' 
    fill_in 'password', with: 'test123' 
    click_on 'Sign Up!'
end