feature 'User logs out' do
  scenario 'after sign up' do
    user = build :user
    sign_up_with user

    log_out

    expect(page).to have_content "You are now logged out."
  end

  def log_out
    click_button 'Log out.'
  end
end
