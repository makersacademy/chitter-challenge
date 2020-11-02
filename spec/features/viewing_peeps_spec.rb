feature 'viewing peeps' do
  scenario 'user visits peeps page and sees a list of peeps' do
    visit '/peeps'
    sign_up
    click_link 'Create new peep'
    fill_in('message', with: 'Heading to the pub later!')
    click_button('Peep')
    click_link 'Create new peep'
    fill_in('message', with: "Can't belive its Novemeber!")
    click_button('Peep')
    expect(page).to have_content 'Heading to the pub later!'
    expect(page).to have_content "Can't belive its Novemeber!"
  end
end
