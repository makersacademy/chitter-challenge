require 'pg'

feature 'Post a message (peep) to chitter' do
  scenario "user lets people know what they're doing" do
    visit '/'
    fill_in('new_peep', with: 'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.')
    click_button('peep')
    expect(page). to have_content('A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.')
  end
end
