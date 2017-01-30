require 'spec_helper'

feature 'Create peep' do
  scenario 'can create peep if logged in' do
    sign_up
    sign_in
    newpeep(words: 'banana')
    expect(current_path).to eq '/peeps'
    within 'ul#peepfeed' do
      expect(page).to have_content('banana')
    end
  end
  scenario 'cannot create peep if not logged in' do
    visit '/newpeep'
    expect(page).to have_content('You must login first to create a new peep')
  end
  scenario 'peep adds timestamp' do
    sign_up
    sign_in
    newpeep
    expect(current_path).to eq '/peeps'
    within 'ul#peepfeed' do
      expect(page).to have_content (/at.*on.*/)
    end
  end
end

feature 'View peeps' do
  scenario 'peeps visible in reverse order' do
    sign_up
    sign_in
    newpeep(words: 'FirstPeep')
    newpeep(words: 'SecondPeep')
    expect(current_path).to eq '/peeps'
    within 'ul#peepfeed' do
      expect(page).to have_content (/SecondPeep.*FirstPeep/)
    end
  end
  scenario 'root redirects to peeps/' do
    visit '/'
    expect(current_path).to eq '/peeps'
  end
end
