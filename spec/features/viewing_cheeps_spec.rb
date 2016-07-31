feature 'Viewing cheeps' do

  scenario 'I can view all peeps' do
    sign_up
    Cheep.create(content: "This is a cheep")
    visit('/cheeps')
    expect(page.status_code).to(eq(200))
    expect(page).to(have_content("This is a cheep"))
  end
end
