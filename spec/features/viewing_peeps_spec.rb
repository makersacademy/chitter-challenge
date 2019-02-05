# frozen_string_literal: true

feature 'Viewing the Chitter Feed' do
  scenario 'peeps should be in reverse chronological order' do
    do_some_peeps

    visit('/')
    expect(page).to have_content("B!\n1 minute ago\n@a\nA!\n2 minutes ago")
  end
end
