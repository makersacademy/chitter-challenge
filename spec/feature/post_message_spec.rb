feature "post message with time" do
  scenario "it posts time stamped messages in reverse order" do
    visit '/peep/new'
    fill_in 'peep', :with => 'I am a test peep'
    click_on 'Peep'
    expect(page).to have_content('I am a test peep')
    expect(page).to have_content(Time.now.strftime("%k:%M"))
  end
end