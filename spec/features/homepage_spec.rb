require 'spec_helper'
require 'web_helpers'

feature 'Peep' do
  scenario 'peep to the peep baord' do
    sign_in
    fill_in('peep_field', with: 'My first peep')
    click_button('Peep')
    expect(page).to have_content('My first peep')
  end
end


feature 'Log out' do
  scenario 'log out' do
    log_out
    expect(page.current_path).to eq('/users')
  end
end
