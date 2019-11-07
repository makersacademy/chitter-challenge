# frozen_string_literal: true

feature 'Adding a peep' do
  it 'adds a peep that the user can see' do
    visit '/'

    click_button 'Add Peep'
    fill_in 'peep', with: 'Test Peep'
    click_button 'Submit'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Test Peep'
  end
end
