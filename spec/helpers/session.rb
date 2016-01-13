module SessionHelpers
  def user_sign_up(full_name: 'Wade Wilson',
                   username: 'Deadpool',
                   email: 'chimichongas@gmail.com',
                   password: 'ihatewolverine92',
                   password_confirmation: 'ihatewolverine92')
    visit '/'
    expect(page.status_code).to eq(200)
    fill_in('full_name', with: full_name)
    within("//section[@id='sign_up']") { fill_in('username', with: username) }
    fill_in('email', with: email)
    within("//section[@id='sign_up']") { fill_in('password', with: password) }
    within("//section[@id='sign_up']") { 
      fill_in('password_confirmation', with: password_confirmation)
    }
    click_button('Sign up')    
  end
end