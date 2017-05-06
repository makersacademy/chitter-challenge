=begin
feature 'User login in function' do

  scenario 'User can log in to Chitter' do
    visit '/user_log_in'
    expect(page).to have_content 'Log in to Chitter'
    expect(page).to have_field 'email or username'
    expect(page).to have_field 'password'
  end
end
=end
