require 'web_helper'

feature 'Peep' do

  let(:time) { Time.new.strftime("...on %d/%m/%Y at %k:%M") }

  scenario 'post a peep' do
    sign_up
    visit '/peeps/new'
    fill_in 'message', with: 'My first peep'
    click_button 'Done!'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content 'My first peep'
      expect(page).to have_content time
    end
  end

end
