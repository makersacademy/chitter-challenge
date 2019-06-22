feature 'Posting a peep:' do
  scenario 'Users can post a peep' do
    visit('/')
    fill_in('content', with: "This is my peep")
    click_button('Submit')

    expect(page).to have_content "This is my peep"
  end
end
