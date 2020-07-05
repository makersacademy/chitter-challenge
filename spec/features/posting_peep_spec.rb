feature '/live' do
  scenario 'Can visit the homepage and go to the live page' do
    visit('/')
    click_button 'enter'
    expect(page).to have_content("Live Peeps!")
  end
  scenario 'User can post a new peep' do
    connection = PG.connect(dbname: 'chitter_test')

    visit('/post')
    fill_in "peep_txt", :with => "Hello world! This is my first peep!"
    click_button 'post_peep'
    expect(page).to have_content("Hello world! This is my first peep!")
  end
end