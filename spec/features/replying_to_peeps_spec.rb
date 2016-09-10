require 'spec_helper'

feature 'Making Peeps' do
  before do
    sign_up
    peep('hello, world')
  end

  scenario 'Logged In User can reply to a Peep' do
    fill_in :reply, with: 'Hello, to you ;)'
    click_button 'Reply'
    expect(page).to have_content('(Chit Ter) @sir_chitter: Hello, to you ;)')
  end

  scenario 'Logged Out User can not reply to a Peep' do
    sign_out
    expect(page).not_to have_button('Reply')
  end


end
