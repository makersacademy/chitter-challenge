feature "see all peeps in reverse chronological order" do
  scenario "see peeps ordered by time posted" do
    visit('/')
    click_button('Post')
    fill_in('message', with: 'Going to the beach today')
    click_button('Submit')
    click_button('Post')
    fill_in('message', with: 'Just got back to the beach')
    click_button('Submit')

    peeps = page.all('.peep')
    expect(peeps[0]).to have_content('Just got back to the beach')
    expect(peeps[1]).to have_content('Going to the beach today')
  end

  scenario "see time posted" do
    visit('/')
    click_button('Post')
    fill_in('message', with: 'Going to the beach today')
    time = Time.now.strftime("%F %T")
    click_button('Submit')
    
    expect(page).to have_content(time)
  end
end
