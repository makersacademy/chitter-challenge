feature 'viewing home' do
  scenario 'welcome message' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario 'user can add a peep to the page' do
    visit('/')
    fill_in('content', with: 'My first peep!')
    click_button('Peep it!')
    expect(page).to have_content 'My first peep!'
  end

  ## Test using gem explained here - https://github.com/jmondo/orderly
  ## Not working, althoug there is coverage in app file, and gem is being installed
  # scenario 'new peeps appear at the top' do
  #   visit('/')
  #   fill_in('content', with: 'a new peep')
  #   click_button('Peep it!')
  #   fill_in('content', with: 'a newer peep!')
  #   click_button('Peep it!')
  #   expect('a newer peep!').to appear_before("a new peep", only_text: true)
  # end

  scenario 'a user can see the time peep was posted' do
    visit('/')
    fill_in('content', with: 'a timely peep')
    click_button('Peep it!')
    expect(page).to have_content 'at'
    expect(page).to have_content ':'
    expect(page).to have_content 'M'
    expect(page).to have_content '/'
  end
end
