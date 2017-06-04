feature 'make peeps on Chitter' do
  scenario 'user can make a new peep' do
     expect { post_new_peep }.to change(Peep, :count).by 1
  end

  scenario 'new peep is loaded onto Chitter feed' do
    visit('/posts/new')
     fill_in('new_peep', :with => 'Hello world!')
     click_button('PEEP')
     expect(current_path).to eq('/posts/all')
     within 'ul#peeps' do
       expect(page).to have_content 'Hello world!'
    end
  end
end
