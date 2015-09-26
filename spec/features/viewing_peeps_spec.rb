require 'spec_helper'

feature 'Viewing links' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(content: 'Hello, Chitter!')

    visit '/peeps'

    expect(page.status_code).to eq(200)

    within 'ul#peeps' do
      expect(page).to have_content('Hello, Chitter!')
    end
  end

end
