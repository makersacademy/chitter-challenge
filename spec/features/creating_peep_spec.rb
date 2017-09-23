feature 'Creating Peeps' do
  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'title', with: "This is a random title"
    fill_in 'message', with: "This is some random message"
    click_button 'Create peep'

    #expect to be redirected back to the peeps page
    expect(current_path).to eq '/peeps'

    within 'ul#peeps'
    expect(page).to have_content ('This is a random title')
  end
end
