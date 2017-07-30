feature 'Post peep' do
  scenario 'I can see my posted peep' do
    visit '/'
    expect(page.status_code).to eq 200
    Peep.create(content: 'My first peep')
    within 'ul#peeps' do
      expect(page).to have_content 'My first peep'
    end
  end

  scenario 'I can see what time my peep was posted' do
    visit '/'
    Peep.create(content: 'What time is it?')
    within 'ul#peeps' do
      expect(page).to have_content Time.now.to_s[0..10]
    end
  end

  scenario 'I can post a peep, and see it' do
    visit '/'
    fill_in :peep, with: 'Peeping again'
    click_button 'Peep!'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content 'Peeping again'
    end
  end
end
