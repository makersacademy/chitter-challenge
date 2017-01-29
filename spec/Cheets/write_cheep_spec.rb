feature "User can send cheeps" do
  scenario "when signed in" do
    sign_in
    click_button "Compose Cheep"
    expect(current_path).to eq '/cheep/new'
    fill_in :cheep, with: "Hello, this is a test!"
    click_button "Cheep!"
    expect(page).to have_content("Hello, this is a test!")
  end
end
