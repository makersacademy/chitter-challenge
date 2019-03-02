feature 'Posting to Chitter' do

  scenario 'visits landing page and posts a peep' do
    visit '/'
    fill_in 'postbox', with: "First peep"
    click_button 'Post my peep'
    expect(page).to have_content("First peep")
  end

end
