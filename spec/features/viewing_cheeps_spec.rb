=begin

feature 'Viewing cheeps' do

  scenario 'I can view all peeps' do
    sign_up
    Cheep.create(content: "This is a cheep", user_id: 1)
    click_button('Sign out')
    visit('/cheeps')
    expect(page.status_code).to(eq(200))
    within 'ul#cheeps' do
      expect(page).to(have_content('This is a cheep'))
    end
  end

  scenario 'cheeps display posted time' do
    sign_up
    cheep = Cheep.create(content: "This is a cheep", user_id: 1)
    visit('/cheeps')
    within 'ul#cheeps' do
      expect(page).to(have_content("#{cheep.time}"))
    end
  end


end
=end
