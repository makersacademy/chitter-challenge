feature 'viewing peeps' do
  before do
    sign_up
  end

  scenario 'existing peeps are displayed on homepage' do
    post_peep('Peeping all over chitter')
    visit('/peeps')
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Peeping all over chitter')
    end
  end
  scenario 'existing peeps are displayed in reverse chronological order' do
    post_peep("Post today")
    Timecop.freeze(Time.local(2019))
    post_peep("Post Jan 1")
    Timecop.return
    sleep(5)
    post_peep("Post later today")
    expect("Post today").to appear_before('Post Jan 1')
    expect("Post later today").to appear_before('Post today')
  end
end

feature 'Peeps include users name and username' do
  scenario 'user signs in and posts peep' do
    sign_up
    post_peep("Hello World")
    expect(page).to have_content "123 Test"
  end
end

feature 'Peeps posts include the time posted' do
  scenario 'User adds a post in Jan 2019' do
    sign_up
    Timecop.freeze(Time.local(2019))
    post_peep("Hello World")
    expect(page).to have_css("#timestamp", text:"created on posted 01/01/2019 @ 12:00AM")
    expect(page).to have_css("#post", text:"Hello World")
    Timecop.return
  end
end
