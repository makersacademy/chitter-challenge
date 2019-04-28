feature 'Posting Peep' do
  scenario 'user can post message to stream' do
    visit "/stream"

    fill_in("peep", with: "Hello")
    click_button("Post")
    expect(page).to have_content "Hello"
  end
end
