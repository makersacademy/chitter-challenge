require 'spec_helper'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do

    Peep.create(message: "Message 1", name: "Jo")
    Peep.create(message: "Message 2", name: "John")
    Peep.create(message: "Message 3", name: "Sam")

    visit('/peeps')

    expect(page).to have_content("Message 1 - Jo")
    expect(page).to have_content("Message 2 - John")
    expect(page).to have_content("Message 3 - Sam")
  end
end

