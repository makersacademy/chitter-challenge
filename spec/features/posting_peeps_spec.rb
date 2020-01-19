feature "Posting Peeps" do
  scenario "it allows the user to post a peep" do
    visit('/peeps')
    fill_in :peep, with: 'Hello Chitter!' 
    click_button('Peep')
    expect(page).to have_content 'Hello Chitter!'
  end
end