feature 'viewing peeps' do
  scenario 'i can see all peeps on the main page' do
    Peep.create(name: 'yulia', nickname: 'cnn', body: 'my first peep', time: '5:22 pm - 27 Jul 2017')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('my first peep')
    end
  end
end
