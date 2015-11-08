require 'web_helper'

feature 'user signs in an peeps a message' do

  scenario 'user succesfully logs in and peeps a message' do
    join
    fill_in 'peep', with: 'Damn synatax'
    click_button('Peep')
    expect(page).to have_content('Damn synatax')
  end
end
