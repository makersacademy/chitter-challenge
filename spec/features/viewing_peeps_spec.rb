require 'spec_helper'

feature 'viewing peeps' do
  scenario 'I can see all peeps in reverse chronological order' do
    Peep.create(author: 'James', comment: 'This is my first peep', created: '16-10-22 17:10')

    visit '/peeps'

    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('This is my first peep')
    end

  end


end
