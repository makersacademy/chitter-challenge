feature 'make peeps on Chitter' do
  scenario 'user can make a new post' do
    visit('/posts/new')
     fill_in('new_peep', :with => 'Hello world!')
     click_button('PEEP')
     expect(current_path).to eq('/posts/all')
     expect(page).to have_content 'Hello world!'
  end
end
