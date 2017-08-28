feature 'Submit a new post' do
  scenario 'I can use a form to submit a new post' do
    visit '/new_post'

    fill_in "title", :with => "Best Idea Created by MEE"
    fill_in "chit", :with => "Electrons can be in many places at the same time"
    
    click_button "Everyone will be so pleased to hear about me!"

    expect(current_path).to eq '/home'

    within 'ul#posts' do
       expect(page).to have_content("Best Idea Created by MEE")
    end
  end
end
