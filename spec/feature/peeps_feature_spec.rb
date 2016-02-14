require 'spec_helper'
require 'web_helpers'
require './app/chitter.rb'


feature 'Peeps' do

  scenario 'I can create a new peep after signing in' do
    sign_up
    sign_in
    click_button('New peep')
    fill_in 'title',   with: 'Peep 1'
    fill_in 'message',   with: 'I am the first peep'
    click_button('Peep!')
    expect(page).to have_content('Peep 1')
  end

  scenario 'I cannot create a new peep if Im not signed in' do
    visit '/peeps/new_peep'
    expect(page).to have_content('Sorry, you need to be signed in to make a new peep.')
    expect(page).not_to have_content('Peep!')
  end

  # scenario 'peeps display the username of the person that created them' do
  #   sign_up
  #   sign_in
  #   create_peep('I am the first peep', 'Peep 1')
  #   visit '/'
  #   expect(page.status_code).to eq 200
  #   expect(page).to have_content('User 1')
  # end
  #
  # scenario 'peeps display the time and date that they were created' do
  #   sign_up
  #   sign_in
  #   create_peep('I am the first peep', 'Peep 1')
  #
  #   visit '/'
  #
  #   expect(page.status_code).to eq 200
  #
  # end


end
