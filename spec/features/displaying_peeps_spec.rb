feature 'Displaying Peeps' do
  let!(:peep) { Peep.create(text: 'Test peep') }
  background { visit '/' }

  scenario 'A user can see a peep' do
    expect(page).to have_content 'Test peep'
  end

  scenario 'A user can see a history of all previous peeps' do
    fill_in :peep, with: 'Second test peep'
    click_button 'Submit'

    expect(page).to have_content 'Test peep'
    expect(page).to have_content 'Second test peep'
  end

  scenario 'A user can see the the peeps in reverse chronological order' do
    second_peep
    expect('Second test peep').to appear_before 'Test peep'
  end
end
