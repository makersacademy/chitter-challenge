feature 'add a cheep' do

  scenario 'a new cheep should appear on the feed page' do
    add_hello_world_cheep
    sleep(1)
    fill_in 'cheep', :with => 'Bonjour world!'
    click_button 'send cheep!'
    click_button 'visit feed'
    save_and_open_page
    expect('Bonjour world!').to appear_before('Hello world!')
  end

end
