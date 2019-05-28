feature "signing up" do
  scenario "the homepage has a sign up feature" do
    visit '/'
    fill_in('name', with: "Mo Salah")
    fill_in('username', with: "champsleagueisours2k19")
    fill_in('email', with: "mo_salah@lfc.co.uk")
    fill_in('password', with: "ilovelfc")
    click_button('Sign up!')
    expect(page).to have_content "You are now signed in to Chitter"
  end
end
