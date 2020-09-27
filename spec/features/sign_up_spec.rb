feature 'sign-up' do 
  scenario 'user can sign-up' do 
    visit('/sign_up')
    fill_in('email', with: 'email@test.com')
    fill_in('password', with: 'password1234')
    fill_in('username', with: 'user47')
    click_on('submit')
    
    expect(page).to have_content 'Hello, user47'
  end 
end