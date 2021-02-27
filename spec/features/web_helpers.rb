def sign_up_and_login
    visit('/')
    click_link('Sign Up')
    fill_in :email, with: 'rafswid@icloud.com'
    fill_in :password, with: 'cabbage'
    fill_in :name, with: 'Raf Swiderski'
    fill_in :username, with: 'rafswid'
    click_button('Sign Up')
end