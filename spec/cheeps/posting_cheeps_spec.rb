include CheepHelpers

feature "Users can post cheeps" do
  scenario "when signed in" do
    expect { sign_in_and_cheep }.to change(Cheep, :count).by(1)
  end
end

feature "Users cannot post cheeps" do
  scenario "before they have signed in" do
    visit '/home'
    expect(page).not_to have_content "Compose Cheep"
  end

  scenario "after they have signed out" do
    sign_in
    click_button "Sign Out"
    expect(page).not_to have_content "Compose Cheep"
  end
end

feature "Cheeps are displayed on screen" do
  scenario "after the user has posted a cheep" do
    sign_in_and_cheep
    expect(page).to have_content "Hello, this is a test!"
  end

  scenario "after the user has signed out" do
    sign_in_and_cheep
    click_button "Sign Out"
    expect(page).to have_content "Hello, this is a test!"
  end
end
