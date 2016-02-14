require 'spec_helper'

feature 'View Peeps' do
  scenario 'a user visits the feed and can see posted peeps' do
    Peep.create(name:"Bob", username: "bob321", content: "hello, this is a test peep and it consists of a message")

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('bob')
      expect(page).to have_content('bob321')
      expect(page).to have_content('hello, this is a test peep and it consists of a message')

    end

  end

  scenario 'a user can view a peep when signed out' do
  end

end
