feature 'add a cheep' do

  scenario 'a new cheep should appear on the feed page' do
    visit 'cheeps/new'
    fill_in 'cheep', :with => 'Hello world!'
    click_button 'send cheep!'
    click_button 'visit feed'
    expect(page).to have_text 'Hello world!'
  end

end
