require 'spec_helper'
require './app/models/peep'

feature 'Viewing Peeps' do
  scenario 'Previously written peeps are visible on the page' do
    sign_up
    log_in
    add_peep
    expect(page.status_code).to eq 200
    expect(page).to have_content('Ed Balls')
  end
end
