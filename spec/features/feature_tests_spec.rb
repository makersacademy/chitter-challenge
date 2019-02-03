require 'pg'


feature 'Testing infrastructure' do
    scenario 'It should visit main page and display - Welcome to Chitter' do
    visit ('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end

feature 'Posting messages' do
  scenario 'Messages should be posted and displayed on first page' do
    visit ('/')
    fill_in('message', with: 'my first chitter!')
    click_button('chitter!')
    expect(page).to have_content "my first chitter!"
  end

  # scenario 'Messages should be posted in reverse order' do
  #   visit ('/')
  #   fill_in('message', with: 'my first chitter!')
  #   fill_in('message', with: 'my second chitter!')
  #
  #   click_button('chitter!')
  #   Peeps.body.should contain("my first chitter!")
  # end

  feature 'Signing up' do
    scenario 'Should allow user get to the sign up sheet' do
      visit ('/')
      fill_in('message', with: 'my first chitter!')
      click_button('sign up!')
      expect(page).to have_content "Please complete the form below, to join chitter!"
    end
  end


end
