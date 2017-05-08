def sign_up
    visit '/users/new'
    fill_in 'username', with: 'axcochrane' 
    fill_in 'password', with: 'test123' 
    fill_in 'password_confirmation', with: 'test123' 
    click_on 'Sign Up!'
end

def sign_up_nonmatching_pw
    visit '/users/new'
    fill_in 'username', with: 'axcochrane' 
    fill_in 'password', with: 'test123' 
    fill_in 'password_confirmation', with: 'test' 
    click_on 'Sign Up!'
end

def log_in
    visit '/sessions/new'
    fill_in 'email', with: 'axcochrane@gmail.com' 
    fill_in 'password', with: 'test123' 
    click_on 'Sign In!'
end