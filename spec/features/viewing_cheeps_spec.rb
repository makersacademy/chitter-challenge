feature 'Viewing cheeps' do

  scenario 'I can view all peeps' do
    sign_up
    Cheep.create(content: "This is a cheep", user_id: 1)
    visit('/cheeps')
    expect(page.status_code).to(eq(200))
    within 'ul#cheeps' do
      expect(page).to(have_content('This is a cheep'))
    end
  end
end
