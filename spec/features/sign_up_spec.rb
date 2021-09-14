feature "Sign up" do
  scenario "User can sign up and get a confirmation" do
    visit '/'
    click_button 'Sign Up'
    fill_in('username', with: "CRISPR")
    fill_in('email', with: "cispr@yahoo.com")
    fill_in('password', with: "123456")
    click_button('Submit')
    expect(page).to have_content('Welcome!')
  end
end
