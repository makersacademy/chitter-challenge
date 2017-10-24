feature 'Viewing tips' do

  scenario 'On the tips page I can see a list of tips' do
    create_some_tips
    visit '/posts'

    expect(page.status_code).to eq 200

    within 'ul#posts' do
      expect(page).to have_content "Remember to eat your greens!"
    end
  end
end
