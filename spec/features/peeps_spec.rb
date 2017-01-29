require 'spec_helper'

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
