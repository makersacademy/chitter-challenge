# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature '1. Posting Peeps' do
  scenario '1.1 Visiting the index page' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario '1.2 Viewing peeps' do
    visit '/peeps'
    expect(page).to have_content 'This is peep 1'
    expect(page).to have_content 'This is peep 2'
    expect(page).to have_content 'This is peep 3'
  end

  scenario '1.2 Posting a peep' do
    visit '/post'
    fill_in('peep', with: 'This is a new peep')
    click_button('Submit')
    expect(page).to have_content "This is a new peep"
  end
end
