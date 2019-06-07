
feature 'chitter' do
  before(:each) do
    Peep.destroy
    create_peeps
  end

  # Capybara.default_driver = :selenium
  # Capybara.server = :webrick

  feature 'viewing peeps' do 
    scenario 'peep is present on the page' do
      visit '/'
      expect(page).to have_css('.text', text: 'First ever peep!!!!')
    end

    scenario 'peeps are in chronological order' do
      visit '/'
      within all('.peep').last do
        expect(page).to have_css('.text', text: 'First ever peep!!!!')
      end
    end

    scenario 'peep times are displayed' do
      now = Time.now
      Peep.create(text: "Hello", created_at: now)
      date_time = now.strftime("#{now.day.ordinalize} of %B, %Y at%l:%M%P")
      visit '/'
      within first('.peep') do
        expect(page).to have_css('.datetime', text:date_time)
        expect(page).to have_css('.text', text:"Hello")

      end
    end
  end

  feature 'peeping (posting peeps)' do
    scenario 'user can click the post button and be taken to the post page' do
      visit '/'
      click_button('Post a peep')
      expect(page).to have_field('text')
      expect(page).to have_button('Submit')
    end

    scenario 'user can peep and see their peep at the top of the index page' do
      visit '/'
      click_button('Post a peep')
      fill_in('text', with: 'I can peep too!')
      click_button('Submit')
      within first('.peep') do
        expect(page).to have_css('.text', text: 'I can peep too!')
      end
    end
  end
end