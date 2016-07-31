feature 'Create cheep' do

  before(:each) do
    User.create(name: "John Smith",
                email: "john.smith@example.com",
                username: "jsmith",
                password: '12345',
                password_confirmation: '12345')
  end

  scenario 'when not signed in' do
    visit('/cheeps/new')
    expect(page).to(have_content("You must be signed in to cheep"))
    click_button("Back to homepage")
    expect(current_path).to(eq('/cheeps'))
  end

  scenario 'when signed in' do
    sign_in(username: "jsmith", password: "12345")
    click_button("New cheep")
    fill_in :content, with: "This is a cheep"
    click_button("Cheep!")
    expect(current_path).to(eq('/cheeps'))
    within 'ul#cheeps' do
      expect(page).to(have_content('This is a cheep'))
    end
  end

end
