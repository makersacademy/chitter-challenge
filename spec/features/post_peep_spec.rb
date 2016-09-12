require 'spec_helper'
feature 'post and display peeps' do
  scenario 'when submitting a peep' do
    visit '/home/new'
    fill_in('peep', with: 'This is my first peep!')
    click_button('Peep')
    expect(page.status_code).to eq 200
    expect(current_path).to eq '/home'
    within 'ul#peeps' do
      expect(page).to have_content('This is my first peep!')
    end
  end
end
