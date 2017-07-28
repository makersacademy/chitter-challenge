feature "User details on messages" do
  scenario "User posts a message and sees their name and username next to it" do
    sign_up
    post_new_peep("Say my name")
    expect(page.find('li:nth-child(1)')).to have_content("Kynosaur")
    expect(page.find('li:nth-child(1)')).to have_content("Kye Bracey")
  end
end
