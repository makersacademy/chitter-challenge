feature "Creating users" do
  scenario 'The email must be a valid email' do
    visit('/users/new')
    fill_in('url', with: 'not a real email')
    click_button('Sign up')

    expect(page).not_to have_content "not a real email"
    expect(page).to have_content "You must submit a valid email."
  end
end
