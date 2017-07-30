require 'pry'

feature 'viewing peeps' do
  scenario 'I can create the new peep' do
    visit '/peeps'
    fill_in 'message', with: 'my first peep'
    click_button 'Peep'
    expect(current_path).to eq('/peeps')
      within 'ul#peeps' do
        expect(page).to have_content('my first peep')
      end
    end
end
