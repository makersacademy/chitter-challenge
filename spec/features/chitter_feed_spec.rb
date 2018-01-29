feature 'add a cheep' do

  scenario 'a new cheep should appear on the feed page' do
    add_hello_world_cheep
    sleep(1)
    add_cheep('Bonjour world!')
    click_button 'visit feed'
    expect('Bonjour world!').to appear_before('Hello world!')
  end

  scenario 'see the time I added a cheep at' do
    Cheep.create(:message => "hello", :created_at => '2018-01-28 09:20:15 +0000')
    visit '/cheeps'
    expect(page).to have_text('09:20')
  end
end
