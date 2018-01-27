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
    post_peep("3")
    sleep(10)
    post_peep("2")
    sleep(10)
    post_peep("1")
    expect("1").to appear_before('2')
    expect("2").to appear_before('3')
  end
end
