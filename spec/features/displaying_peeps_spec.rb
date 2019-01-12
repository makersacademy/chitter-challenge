feature 'Displaying Peeps' do
  scenario 'A user can see a peep' do
    post_peep
    expect(page).to have_content 'Test peep'
  end

  scenario 'A user can see a history of all previous peeps' do
    post_peep
    fill_in :peep, with: 'Second test peep'
    click_button 'Submit'

    expect(page).to have_content 'Test peep'
    expect(page).to have_content 'Second test peep'
  end
end
