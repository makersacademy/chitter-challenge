feature 'create' do
  scenario 'so that user can sign up on landing page' do
    visit ('/')
    click_button 'Sign up'
    fill_in 'username', with: "Jedward"
    fill_in 'email', with: "edward@makers.com"
    click_button 'Submit'
    expect(page.status_code).to eq 200

    # within 'ul#wall' do
      expect(page).to have_content("Account created")
    # end
  end
end
