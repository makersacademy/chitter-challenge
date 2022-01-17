# frozen_string_literal: true

require './app'

feature 'viewing cheets' do
  before do
    Chitter.create(message: 'Love is strength', display_name: 'Quackie')
    Chitter.create(message: 'Dream it, be it', display_name: 'T0ilet_duck')
    Chitter.create(message: 'The last word', display_name: 'Duck_Tape')
  end
  scenario 'shows a list of cheet. messages' do
    visit('/')
    expect(page).to have_content('Love is strength')
    expect(page).to have_content('Dream it, be it')
    expect(page).to have_content('The last word')
  end

  scenario 'shows who cheet' do
    visit('/')
    expect(page).to have_content('cheeted by Quackie')
    expect(page).to have_content('cheeted by T0ilet_duck')
    expect(page).to have_content('cheeted by Duck_Tape')
  end

  scenario 'shows timestamp of cheet' do
    visit('/')
    loadhour = Time.now.strftime('%F %H:')
    expect(page).to have_content("at #{loadhour}")
  end

  scenario 'displays in reverse chronological order' do
    visit('/')
    expect(page).to have_content("Latest cheets:\n\"The last word\" cheeted by Duck_Tape, at")
  end
end
