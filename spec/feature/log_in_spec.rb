require 'web_helper'

feature 'user logs in' do

  scenario 'user succesfully logs in' do
    join
    log_in
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Welcome Gio!')
  end
end
