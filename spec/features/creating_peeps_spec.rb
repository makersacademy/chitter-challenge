feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'body',   with: 'I love to peep!'
    fill_in 'title', with: 'Test peep'
    click_button 'Create peep'

    # we expect to be redirected back to the peeps page
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Test peep')
    end
  end
end