feature "Sign in" do
  scenario "Person signs in to use chitter" do
    visit '/signin'
    expect(page).to have_content 'Please sign in'
  end
end
