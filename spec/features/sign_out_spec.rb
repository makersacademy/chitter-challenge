feature 'Sign-Out' do
  before(:each) do
    create_user
  end

  scenario 'When Signed in' do
    sign_in
    click_button 'Sign Out'
    expect(page).to have_content("Goodbye!")
  end

end
