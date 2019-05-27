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

  scenario "a user can see the time a peep was made" do
    visit('/')
    fill_in('peep', with: "It's cloudy outside")
    click_button('Post')
    time = Time.now.strftime("%Y-%m-%d %H:%M")

    expect(current_path).to eq('/')
    expect(page).to have_content(time)
  end
end