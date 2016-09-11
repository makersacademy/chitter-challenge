require 'spec_helper'

feature 'Peeps can be posted' do
  scenario 'A user posting a peep' do
    sign_up

    visit '/peeps/new'
    fill_in('peep', :with => 'Hello!')
    click_button('Peep!')
    expect(page).to have_content("jamesman peeped: Hello")

  end
end
