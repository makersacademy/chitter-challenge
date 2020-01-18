feature 'post peep' do
  scenario 'able to post a peep' do
    visit('/')
    fill_in(:peep, with: "peep")
    click_button("Post Peep!")
    visit('/peeps')
    expect(page).to have_content("peep")
  end
end