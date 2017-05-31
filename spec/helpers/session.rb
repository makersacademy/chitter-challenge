module SessionHelpers
  # As of ruby v2.1 no default arguments required (e.g. "email: "blah@blah.com"")
  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
