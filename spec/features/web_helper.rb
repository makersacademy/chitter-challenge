def sign_in
    visit('/sign_in/new')
    fill_in 'username', with: 'JS_500'
        fill_in 'email', with: 'js@mail.com'
        fill_in 'password', with: '12345'
        fill_in 'name', with: 'Josh Steadman'
        click_button 'sign-in'
end