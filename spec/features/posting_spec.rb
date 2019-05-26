feature "clicking 'Peep'" do
  scenario "should post your peep on the index page" do
    visit '/'
    click_button('Post')
    fill_in('text', with: 'I feel grrrrrreat')
    click_button('Peep')
    expect(page).to have_content('I feel grrrrrreat')
  end
end
