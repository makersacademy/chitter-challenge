require 'spec_helper'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do

    Peep.create(message: "Message 1")
    Peep.create(message: "Message 2")
    Peep.create(message: "Message 3")

    visit('/peeps')

    expect(page).to have_content "Message 1"
    expect(page).to have_content "Message 2"
    expect(page).to have_content "Message 3"
  end
end

