require_relative '../factories/user'
require 'spec_helper'

feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    user = create :user
    Peep.create(peep: 'hello world')
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('hello world')
    end
  end

end
