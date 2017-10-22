feature 'View peeps' do
  scenario 'View all peeps in reverse chronological order' do
    create_new_peep('First peep')
    create_new_peep('Second peep')
    visit '/peeps'
    # expect(page).to have_content
    expect(page.body).to match(/.*'Second peep'.*'First peep'/)
    # expect(page).to have_content("ul:first-child", :text => "Second peep")
    # expect(page).to have_content("ul:last-child", :text => "First peep")
    # page.find("#ul:first-child", :text => "Second peep")
    # page.find("#ul:last-child", :text => "First peep")
  end
end
