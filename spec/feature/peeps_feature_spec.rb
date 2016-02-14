require 'spec_helper'
require 'web_helpers'
require './app/chitter.rb'


feature 'Peeps' do

  scenario 'peeps display the username of the person that created them' do
    sign_up
    sign_in
    create_peep('I am the first peep', 'Peep 1')

    visit '/'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('User 1')
    end
  end

  scenario 'peeps display the time and date that they were created' do
    sign_up
    sign_in
    create_peep('I am the first peep', 'Peep 1')

    visit '/'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      # expect(page).to have_content()
    end
  end


end
