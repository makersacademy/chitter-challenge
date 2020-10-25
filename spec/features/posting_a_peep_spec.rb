feature 'user can post to chitter' do
  scenario 'user is able to input text and submit - posting a peep to chitter' do
    visit('/chitter_feed/new_peep')
    fill_in 'peep_text', with: 'IT HAS BEEN 4 MONTHS SINCE MY LAST HAIR APPOINTMENT'
    click_on 'post'
    visit('/chitter_feed')
    expect(page).to have_content('IT HAS BEEN 4 MONTHS SINCE MY LAST HAIR APPOINTMENT')
  end
  #first to click button on chitter feed that redirects to new peep
end