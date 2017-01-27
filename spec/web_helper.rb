def sign_up   
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,                 with: 'michael@jackson.com'
    fill_in :name,                  with: 'Michael Jackson'
    fill_in :user_name,             with: 'mj'
    fill_in :password,              with: 'password'
    fill_in :password_confirmation,  with: 'password'
    click_button 'Sign up'
end
