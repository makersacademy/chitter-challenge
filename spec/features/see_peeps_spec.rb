feature "see peeps" do

  before do
    visit '/feed'

    fill_in('peep_box', with: 'first peep')
    click_button 'send peep'
    fill_in('peep_box', with: 'second peep')
    click_button 'send peep'
    fill_in('peep_box', with: 'third peep')
    click_button 'send peep'
  end

  scenario "see peeps" do
    visit '/feed'
    expect(page).to have_content 'first peep'
    expect(page).to have_content 'second peep'
    expect(page).to have_content 'third peep'
  end

  scenario "see peeps in reverse order" do
    expect(page.body.index('second peep')).to be < page.body.index('first peep')
  end

end
