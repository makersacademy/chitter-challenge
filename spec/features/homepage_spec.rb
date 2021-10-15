feature 'Homepage' do
  scenario 'Homepage should display a welcome message' do
    visit '/'
    expect(page).to have_text('Welcome to Chitter')
  end

  scenario 'Homepage should have a button to allow users to view peeps' do
    visit '/'
    click_button('View all Peeps')
    expect(page).to have_text('This is a test peep')
  end
end
