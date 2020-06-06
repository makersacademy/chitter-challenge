feature 'add a peep' do
  
  scenario 'adds a peep to the list' do
    visit('/')
    click_button "Post a Peep"
    fill_in('title', with: "Test")
    fill_in('body', with: "this is a test peep")
    click_button "Post"

    expect(page).to have_content "You're peep has been posted!"
  end
end