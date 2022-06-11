# ./spec/landing_page_spec.rb

feature 'Posting and viewing peeps' do
  scenario 'it allows me to post and view a peep' do
    visit('/mypeeps')
    fill_in("new_peep", with: 'This is my latest peep!')
    click_button "PEEP!"
    expect(page).to have_content 'This is my latest peep!'
  end

  scenario 'it allows me to post and view a peep' do
    DatabaseConnection.query(
      "INSERT INTO peeps (content, peeper, post_time) VALUES($1, $2, current_timestamp)",
      ['A peep by Tom', 'tom']
    )
    DatabaseConnection.query(
      "INSERT INTO peeps (content, peeper, post_time) VALUES($1, $2, current_timestamp)",
      ['A peep by Jerry', 'jerry']
    )
    
    visit('/viewpeeps')
    expect(page).to have_content 'A peep by Jerry'
    expect(page).to have_content 'A peep by Tom'
  end
end
