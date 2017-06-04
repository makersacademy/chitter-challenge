feature 'make peeps on Chitter' do
  scenario 'user can make a new peep' do
     expect { post_new_peep }.to change(Peep, :count).by 1
  end

  scenario 'new peep is loaded onto Chitter feed' do
    post_new_peep
    expect(current_path).to eq('/posts/all')
    within 'ul#peeps' do
      expect(page).to have_content 'Hello world!'
    end
  end
end
