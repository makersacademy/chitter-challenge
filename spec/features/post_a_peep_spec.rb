feature 'Post a peep' do

  scenario 'A user can post a peep' do
    visit '/peeps'
    fill_in 'peep', with: 'My first peep'
    click_button 'Post'
    expect(page).to have_content 'My first peep'
  end

end
