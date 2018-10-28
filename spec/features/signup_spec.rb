require_relative './web_helpers'

feature 'Siging Up' do
  scenario 'user cannot sign up if email already exists' do
    visit('/chitter')
    sign_up
    log_out
    click_link('Sign Up')
    fill_in(:first_name, with: 'diff_first_name')
    fill_in(:last_name, with: 'diff_last_name')
    fill_in(:email, with: 'amy_smith@mail.com')
    fill_in(:username, with: 'diff_username')
    fill_in(:password, with: 'diff_password')
    click_button('Submit')
    expect(page).to have_content("Sign Up to Chitter")
  end

  scenario 'user cannot sign up if username already exists' do
    visit('/chitter')
    sign_up
    log_out
    click_link('Sign Up')
    fill_in(:first_name, with: 'diff_first_name')
    fill_in(:last_name, with: 'diff_last_name')
    fill_in(:email, with: 'diff_email')
    fill_in(:username, with: 'AmyS')
    fill_in(:password, with: 'diff_password')
    click_button('Submit')
    expect(page).to have_content("Sign Up to Chitter")
  end
end
