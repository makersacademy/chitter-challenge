require_relative '../web_helpers'

feature 'user sign up' do
  scenario 'user must enter matching password' do
    sign_up_nonmatching_pw
    expect { sign_up_nonmatching_pw }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation do not match'
  end
end