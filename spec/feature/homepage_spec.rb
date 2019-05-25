feature 'homepage' do
  scenario 'will let me post a peep' do
    visit '/chitter'
    expect(page).to have_content 'Chitter'
    expect(page).to have_field 'peep'
    expect(page).to have_button 'Post'
  end

  it 'will let me view the previous peeps' do
    visit'/chitter'
    fill_in 'peep', with: 'My first Peep!'
    click_button 'Post'
    expect(page).to have_content 'My first Peep!'
  end
end
