
feature "post" do
  scenario "make a post" do
    visit('/')
    fill_in('peepMessage', with: 'ok, boomer')
    click_button('Peep')

    expect(page).to have_content('ok, boomer')
    expect(page).to have_content(Time.now.strftime("%d/%m/%y (%a) %H:"))
  end
end