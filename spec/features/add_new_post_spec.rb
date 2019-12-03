feature 'Add a new peep' do
  scenario 'User can add a new post' do
    visit '/'
    click_on "New peep"
    visit 'new-peep'
    fill_in "message", with: "Hello there!"
    click_on "Post"
    expect(page).to have_content "Hello there!"
  end
end
