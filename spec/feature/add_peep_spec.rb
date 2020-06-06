feature 'add a peep' do
  
  scenario 'it should add a peep to the list' do
    visit('/peeps/new')
    fill_in('title', with: "Test")
    fill_in('peep', with: "this is a test peep")
    click_button "Post Peep"

    expect(current_path).to eq '/peeps'
    expect(page).to have_content "this is a test peep"
  end
end
