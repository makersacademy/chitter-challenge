

module SessionHelpers

  def sign_up(email: 'mat@example.com', password: 'password', password_confirmation: 'password')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Submit'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def upload_peeps
    visit '/peeps/new'
    fill_in 'content', with: "First Peep"
    click_on 'Post'

    visit '/peeps/new'
    fill_in 'content', with: "Second Peep"
    click_on 'Post'
  end

end
