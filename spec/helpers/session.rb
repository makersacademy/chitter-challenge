module SessionHelpers
  def user_sign_up(full_name: 'Wade Wilson',
                   username: 'Deadpool',
                   email: 'chimichongas@gmail.com',
                   password: 'ihatewolverine92',
                   password_confirmation: 'ihatewolverine92')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in('full_name', with: full_name)
    within("//section[@id='sign_up']") { fill_in('username', with: username) }
    fill_in('email', with: email)
    within("//section[@id='sign_up']") { fill_in('password', with: password) }
    within("//section[@id='sign_up']") do
      fill_in('password_confirmation', with: password_confirmation)
    end
    click_button('Sign up')
  end

  def user_log_in(username:, password:)
    visit '/sessions/new'
    expect(page.status_code).to eq(200)
    within("//section[@id='log_in']") { fill_in('username', with: username) }
    within("//section[@id='log_in']") { fill_in('password', with: password) }
    click_button('Log in')
  end
end
