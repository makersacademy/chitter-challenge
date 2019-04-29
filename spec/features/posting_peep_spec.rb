feature 'Posting Peep' do
  scenario 'user can post message to chitter stream' do
    visit "/chitter/new"

    fill_in("peep", with: "Hello")
    click_button("Post")
    expect(page).to have_content "Hello"
  end
end
