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

  it 'presence of add peep button' do
    expect(page).to have_button 'Peep'
  end


end
