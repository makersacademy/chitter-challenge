require 'spec_helper.rb'

feature 'Viewing peeps' do

  scenario 'I can see peeps on the homepage' do
    peep
    log_out
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Walter is a softy')
    end
  end

  scenario 'Peeps have the name of the person who peeped them' do
    peep
    log_out
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('Dennis The Menace')
    end
  end

  scenario 'Peeps have the userhandle of the person who peeped them' do
    peep
    log_out
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('@DennisDaMennace')
    end
  end

end
