feature "Viewing peeps in reverse chronological order" do
  scenario "a user sees the posts in reverse chronological order" do
    visit('/')
    fill_in('peep', with: "It's cloudy outside")
    click_button('Post')
    fill_in('peep', with: "And now it's sunny!")
    click_button('Post')
    fill_in('peep', with: "It's getting windy")
    click_button('Post')

    expect(current_path).to eq('/')
    expect(first(".peep")).to have_content("It's getting windy")
  end
end