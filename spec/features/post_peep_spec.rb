feature 'post peep' do
  scenario 'able to post a peep' do
    visit('/')
    fill_in :peep, with: "This is a peep!"
    click_button "Post Peep!"
    expect(page).to have_content("This is a peep!")
  end
end