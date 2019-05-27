feature "Adding and viewing peeps" do
  scenario "a user can add multiple peeps and view them" do
    visit('/')
    fill_in('peep', with: "It is cloudy outside")
    click_button('Post')
    fill_in('peep', with: "And now it is sunny!")
    click_button('Post')
    expect(page).to have_content("It is cloudy outside")
    expect(page).to have_content("And now it is sunny!")
  end
end