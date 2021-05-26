# frozen_string_literal: true

require './app'

feature 'viewing quacks' do
  before do
    Quack.create(message: 'Love is strength', display_name: 'Quackie')
    Quack.create(message: 'Dream it, be it', display_name: 'T0ilet_duck')
    Quack.create(message: 'The last word', display_name: 'Duck_Tape')
  end
  scenario 'shows a list of quack messages' do
    visit('/')
    expect(page).to have_content('Love is strength')
    expect(page).to have_content('Dream it, be it')
    expect(page).to have_content('The last word')
  end

  scenario 'shows who quacked' do
    visit('/')
    expect(page).to have_content('quacked by Quackie')
    expect(page).to have_content('quacked by T0ilet_duck')
    expect(page).to have_content('quacked by Duck_Tape')
  end

  scenario 'shows timestamp of quack' do
    visit('/')
    loadhour = Time.now.strftime('%F %H:')
    expect(page).to have_content("at #{loadhour}")
  end

  scenario 'displays in reverse chronological order' do
    visit('/')
    expect(page).to have_content("Latest quacks:\n\"The last word\" quacked by Duck_Tape, at")
  end
end
