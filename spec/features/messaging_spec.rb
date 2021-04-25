feature "Messaging" do
  scenario "A user can create a message" do
    sign_up

    fill_in('message', with: 'Test message')
    click_button('Create message')

    expect(page).to have_content 'Test message'
    expect(page).not_to have_content 'error'
  end

  scenario "A mesage can have a time posted" do
    sign_up

    fill_in('message', with: 'Test message')
    click_button('Create message')

    expect(page).to have_content "#{Time.now.strftime(":Posted at %H:PM %A")}"
  end
end