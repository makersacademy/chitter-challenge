  def sign_up(email = 'alice@example.com',
              password = 'oranges!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end