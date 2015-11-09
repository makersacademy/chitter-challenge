feature "User log out" do
  scenario "After signing up, a user logs out" do
    sign_up
    sign_out
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome Alaan!')
  end
end
