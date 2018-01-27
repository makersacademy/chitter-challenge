feature 'viewing peeps' do
  scenario 'existing peeps are displayed on homepage' do
    Peep.create(post: 'Peeping all over chitter')
    visit('/peeps')
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Peeping all over chitter')
    end
  end
  scenario 'existing peeps are displayed in reverse chronological order' do
    post_peep("Post today")
    Timecop.freeze(Time.local(2018))
    post_peep("Post Jan 1")
    Timecop.return
    sleep(5)
    post_peep("Post later today")
    expect("Post today").to appear_before('Post Jan 1')
    expect("Post later today").to appear_before('Post today')
  end
end

feature 'Peeps posts include the time posted' do
  scenario 'User adds a post in Jan 2018 at midnight ' do
    Timecop.freeze(Time.local(2018))
    post_peep("Hello World")
    expect(page).to have_content "Hello World, posted @Mon Jan 1 00:00:00 2018"
    Timecop.return
  end
end
