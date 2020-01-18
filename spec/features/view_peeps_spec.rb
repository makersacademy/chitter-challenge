feature 'View Peeps' do
  scenario 'User can view all peeps' do
    visit '/'
    click_link 'Write a Peep'
    fill_in 'text', :with => 'My first peep'
    click_button 'Share Peep'
    visit '/'
    click_link 'View Peeps'
    expect(page).to have_content 'My first peep'
  end
end