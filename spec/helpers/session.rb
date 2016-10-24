module SessionHelpers

  def sign_up(email: 'james@example.com', name: 'James', user_name: 'JamesX', password: 'oranges!', password_confirmation: 'oranges!')
    visit '/'
    click_link 'Sign Up'
    expect(page.status_code).to eq(200)
    fill_in :email,     with: email
    fill_in :name,      with: name
    fill_in :user_name, with: user_name
    fill_in :password,  with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email: 'james@example.com', password: 'oranges!')
    sign_up
    click_button('Sign Out')
    click_button('Sign In')
    fill_in :email,    with: email
    fill_in :password, with: password
    click_button('Sign in')
  end

  def post_peep(new_peep: 'hello world')
   sign_in
   click_button('New Peep!')
   fill_in :new_peep, with: new_peep
   click_button('Post')
 end
end
