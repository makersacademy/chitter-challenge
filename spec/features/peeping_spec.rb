feature 'Viewing peeps' do


  scenario 'I can add peeps to the peeps page' do
    sign_up
    visit '/peeps/new'
    fill_in 'message', with: 'Trump here again'
    time = Time.now.strftime("%I:%M %p  %Y-%m-%d")
    peep = Peep.new( time: time, message: 'Trump here again' )
    click_button 'Submit message'
    expect(page).to have_content('Trump here again')
  end
end
