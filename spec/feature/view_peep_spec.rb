# frozen_string_literal: true

feature 'viewing peep' do
  scenario 'able to see peeped posts' do
    visit('/peep')
    expect(page).to have_content "Got'a catch them all!"
    expect(page).to have_content "I met Bulbasaur!"
  end
end