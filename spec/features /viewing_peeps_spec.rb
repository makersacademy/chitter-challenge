require 'spec_helper'

feature 'Viewing peeps' do

  scenario 'I can view existing peeps on the page' do
    Peep.create(message: "This is my first peep. Hello World!")
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content("This is my first peep. Hello World!")
    end
  end

end
