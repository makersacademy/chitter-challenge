feature 'viewing peeps' do
  scenario 'I can see existing peeps' do
    sign_up
    sign_in(email: 'joe_bloggs@gmail.com', password:'12345')

    visit('/peeps/index')
    expect(page.status_code).to eq 200
    visit('/peeps/new')
    fill_in(:content, with: 'My first peep!')
    click_button('Post Peep')

    within 'ul#peeps' do
      expect(page).to have_content('My first peep!')
    end
  end

  xscenario 'to see the time a peep was posted' do
    sign_up
    sign_in(email: 'joe_bloggs@gmail.com', password:'12345')
    visit('/peeps/index')
    expect(page.status_code).to eq 200
    visit('/peeps/new')
    fill_in(:content, with: 'My first peep!')

    Timecop.freeze do
      click_button('Post Peep')
      expect(page).to have_content("#{Time.now.strftime("%d%m%Y at %H:%M")}")
    end
  end

end
