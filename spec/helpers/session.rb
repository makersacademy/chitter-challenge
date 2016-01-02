module SessionHelpers

  def sign_up(email: 'user@email.com', password: 'password', password_confirm: 'password')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in('email', with: email)
    fill_in('password', with: password)
    fill_in('password_confirm', with: password_confirm)
    click_button 'Submit'
  end

end
