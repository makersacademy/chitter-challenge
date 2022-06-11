# ./spec/landing_page_spec.rb

feature 'Posting and viewing my peeps' do
  scenario 'it allows me to post and view a peep' do
    visit('/mypeeps')
    fill_in("new_peep", with: 'This is my latest peep!')
    click_button "PEEP!"
    expect(page).to have_content 'This is my latest peep!'
  end
end
