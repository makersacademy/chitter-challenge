feature 'User signs out' do

  before do
    sign_up_correct_password
    sign_in
  end

  scenario 'while being signed in' do
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, matt@matt.com')
  end

end
