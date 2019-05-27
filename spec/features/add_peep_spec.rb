feature "Adding and viewing peeps" do
  scenario "a user can add multiple peeps and view them" do
    visit('/')
    fill_in('peep', with: "It's cloudy outside")
    click_button('Post')
    fill_in('peep', with: "And now it's sunny!")
    click_button('Post')
    expect(page).to have_content("It's cloudy outside")
    expect(page).to have_content("And now it's sunny!")
  end
end