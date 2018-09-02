feature "create peep" do
  scenario "create peep" do
    visit '/feed'

    fill_in('peep_box', with: 'first peep')
    click_button 'send peep'

    expect(page).to have_content 'first peep'
  end
end
