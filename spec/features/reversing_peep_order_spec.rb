# frozen_string_literal: true

feature 'reversing the order of the peeps' do

  scenario 'A user can view the newest peep first' do
    visit '/chitter'
    fill_in('text', with: '1st peep')
    click_button('Submit')
    fill_in('text', with: '2nd peep')
    click_button('Submit')

    expect(page).to have_content('2nd peep')
    expect(page).to have_content('1st peep')
  end

end
