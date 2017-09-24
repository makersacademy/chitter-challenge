feature 'login' do
  scenario 'so that user can sign in on home page' do
    visit ('/')
    click_button 'Sign in'
    fill_in 'username', with: "Jedward"
    fill_in 'email', with: "edward@makers.com"
    click_button 'Submit'
    expect(page.status_code).to eq 200

    # within 'ul#wall' do
      expect(page).to have_content("Login completed")
    # end
  end
end
