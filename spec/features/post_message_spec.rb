feature 'post message' do
  scenario 'message box exists' do
    visit('/')
    expect(page).to have_field("peep")
  end

  scenario 'submit button exists' do
    visit('/')
    expect(page).to have_button('Post Peep!')
  end

  scenario 'peep is posted and shown' do
    visit('/')
    fill_in('peep', :with => 'my first peep!')
    click_button('Post Peep!')
    expect(page).to have_content('my first peep!')
  end
end
