feature 'add a cheep' do

  scenario 'a new cheep should appear on the feed page' do
    add_hello_world_cheep
    click_button 'visit feed'
    expect(page).to have_text 'Hello world!'
  end

  scenario 'a new cheep should have the username of the person' do
    sign_up_as_clement
    add_hello_world_cheep
    click_button 'visit feed'
    expect(page).to have_text 'Attles1883'
  end

end
