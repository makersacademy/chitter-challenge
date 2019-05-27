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
    expect(current_path).to eq('/')
    expect(first('peep__time')).to have_text(/\d{2}:\d{2}:\d{2}/)
  end
end