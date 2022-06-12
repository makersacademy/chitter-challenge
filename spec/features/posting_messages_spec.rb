feature 'post a peep message' do
  scenario 'a user can post a peep message' do
    visit('/messages/new')
    fill_in('message', with: "This is a peep")
    fill_in('user', with; 'Clare')
    click_button('Submit peep')

    expect(page).to have_content "This is a peep"
  end
end

