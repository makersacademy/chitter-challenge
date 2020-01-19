feature 'shows the time the tweet was made' do 
  xscenario 'a tweet is submited and the user can see the time next to the tweet' do 
    visit('/home')
    fill_in :peep, with: "Hey, how goes the thing?"
    click_button 'Make Peep'
    time = Time.now.strftime("%d/%m/%Y %k:%M")
    expect(page).to have_text(time)
  end 
end 