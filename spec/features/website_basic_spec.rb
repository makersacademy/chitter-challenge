feature 'Website tests:' do
  scenario 'a user can see the website name' do
    visit('/')
    expect(page).to have_content("Chitter")
  end

  scenario 'a user can post a peep' do
    visit('/')
    fill_in('peep', with: 'I had some coffee')
    click_button('Post')
    expect(current_path).to eq('/')
    expect(first('.peep')).to have_content('I had some coffee')
  end

  scenario 'a user sees the posts in reverse chronological order' do
    visit('/')
    fill_in('peep', with: 'I had some coffee')
    click_button('Post')
    fill_in('peep', with: 'I had some cake')
    click_button('Post')
    fill_in('peep', with: 'I had some bread')
    click_button('Post')
    expect(current_path).to eq('/')
    expect(first('.peep')).to have_content('I had some bread')
  end
end