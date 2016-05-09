module SessionHelper

  def log_in (email:, password:)
    visit '/sessions/new'
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button'Log in'
  end

end
