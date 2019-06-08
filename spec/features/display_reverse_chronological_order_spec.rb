require_relative 'feature_methods'

feature "Viewing peeps in reverse chronological order" do
  scenario "a user sees the posts in reverse chronological order" do
    login
    visit('/peeps')

    click_button('Write a Peep')
    fill_in('peep', with: "It's cloudy outside")
    click_button('Peep')

    click_button('Write a Peep')
    fill_in('peep', with: "And now it's sunny!")
    click_button('Peep')

    click_button('Write a Peep')
    fill_in('peep', with: "It's getting windy")
    click_button('Peep')

    expect(current_path).to eq('/peeps')
    expect(first(".card-text")).to have_content("It's cloudy outside")
  end
end