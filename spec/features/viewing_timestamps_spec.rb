# frozen_string_literal: true

feature 'Viewing the Chitter Feed' do
  scenario 'peeps should have a time stamp' do
    peeps_for_time

    visit('/')
    expect(page).to have_content("A!\n1 minute ago\n@a\nB!\n1 hour ago")
    expect(page).to have_content("B!\n1 hour ago\n@a\nC!\n1 day ago")
    expect(page).to have_content("C!\n1 day ago\n@a\nD!\n2 days ago")
    expect(page).to have_content("D!\n2 days ago")
  end
end
