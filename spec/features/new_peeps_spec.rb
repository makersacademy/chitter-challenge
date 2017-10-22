feature 'submit a new peep' do
  scenario 'use a form to submit a new peep' do
    visit '/peeps/new'
    fill_in :content, with: 'Today I created a Twitter clone'
    click_button ('Add Peep')

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content ('Today I created a Twitter clone')
    end
  end
end
