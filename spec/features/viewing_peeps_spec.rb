feature 'Viewing links' do

  scenario 'I can see existing peeps on a page' do
    Peep.create(title: 'OMGz its liek tot4lly Chitter!', message: 'hashtag chitter')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('OMGz')
    end
  end  
end