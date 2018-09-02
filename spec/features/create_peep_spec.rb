feature "create peep" do
  scenario "create peep" do
    visit '/feed'

    fill_in('create peep', with: 'first peep')
    click_button 'send peep'

    expect(page).to have_content 'first peep'
  end
end
