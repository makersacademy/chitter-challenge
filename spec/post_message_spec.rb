require './app.rb'
require './database_cleaner.rb'

feature 'There is a homepage' do
  scenario 'Homepage exists' do
    visit '/home'
    expect(page.status_code).to eq 200
  end
  scenario 'Homepage has welcome text' do
    visit '/home'
    expect(page).to have_content "Welcome to Chitter"
  end
end

feature 'Home page has ability to add posts' do
  scenario 'There is a button to submit new posts' do
    visit '/home'
    click_button "Yes I like my own opinions and know others will too"
    expect(current_path).to eq "/new_post"
  end
end

feature 'Home page has to view posts' do
  scenario 'Old posts are displayed on homepage' do
     Post.create(title: "Best Idea Created by ME", chit: "Electrons can be in many places at the same time")
      visit '/home'
      within 'ul#posts' do
        expect(page).to have_content("Electrons can be in many places at the same time")
      end
  end
   scenario 'Posts are in reverse cronological order' do
     post1= Post.create(title: "Best Idea Created by ME", chit: "Electrons can be in many places at the same time")
     post2= Post.create(title: "MY OPINION MATTERS MORE", chit: "What about the double slit experiement")
     visit '/home'
     within 'ul#posts' do
       expect(post1.id).to eq 1
     end
   end
end
