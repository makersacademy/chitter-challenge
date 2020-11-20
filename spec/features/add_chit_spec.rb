feature 'Add chit' do
  scenario 'Maker adds chit and sees it' do
    visit ('/chits/add')
    fill_in('message', with: 'Test_chit')
    click_button('Post Chit')
    expect(page).to have_content 'Test_chit'
  end

  scenario 'see chits and timestamp displayed with chit' do
    visit ('/chits/add')
    fill_in('message', with: 'Test_chit')
    click_button('Post Chit')
    expect(page).to have_content 'Test_chit'
  end
end
