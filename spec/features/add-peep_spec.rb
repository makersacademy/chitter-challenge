require_relative '../spec_helper'

feature 'add peep' do

  before 'visit peeps homepage' do
    generate_all_examples
    visit '/home'
  end

  it 'presence of peeps' do
    expect(page).to have_content 'Thank you!'
    expect(page).to have_content 'That is a great peep'
  end

  it 'no presence of add peep button if not signed in' do
    expect(page).not_to have_button 'Peep'
  end

  it 'presence of add peep button if signed in' do
    register
    expect(page).to have_button 'Peep'
  end

end

feature 'add a new parent peep' do
  scenario 'new parent peep' do
      register
      fill_in 'new_peep', with: 'example peep!'
      click_button 'Peep'
      expect(page).to have_content 'example peep!'
  end
end
