feature 'Peep time' do
  scenario 'I can see what time my peep was posted' do
    visit '/'
    Peep.create(content: 'What time is it?')
    within 'ul#peeps' do
      expect(page).to have_content Time.now.to_s[0..10]
    end
  end
end
