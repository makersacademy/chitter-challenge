feature 'shows peeps' do
  scenario 'it has a heading' do
    visit('/peeps')
    expect(page).to have_content('Your Peep Feed:')
  end
  scenario 'there is a form for adding a new peep' do
    visit '/peeps'
    expect(page).to have_field "New_peep"
  end
  scenario 'submitting a new peep takes you back to the peeps page' do
    visit '/peeps'
    click_button 'Submit new peep'
    expect(current_path).to eq '/peeps'
  end
  scenario 'submitting new peep adds new peep to database' do
    visit '/peeps'
    fill_in('New_peep', with: 'This is a test peep')
    click_button 'Submit new peep'
    expect(page).to have_content('This is a test peep')
  end

  scenario 'user wants to see bookmarks' do
    Peep.add(content: "This is a test peep")
    Peep.add(content: "This is another test peep")

    visit('/peeps')
    
    expect(page).to have_content "This is a test peep"
    expect(page).to have_content "This is another test peep"
  end
end
