feature "User details on messages" do
  scenario "User posts a message and sees their name and username next to it" do
    sign_up
    click_button "Post new Peep"
    fill_in("message_body", with: "Say my name")
    click_button "Submit"
    expect(page.find('li:nth-child(1)')).to have_content("Kynosaur")
    expect(page.find('li:nth-child(1)')).to have_content("Kye Bracey")
  end
end
