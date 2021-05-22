feature 'Adding and viewing comments' do
    feature 'a user can add and then view a comment' do
        scenario 'a comment is added to a chirp' do
            chirp = Chirps.create(chirp: 'Read the omment below', title: 'Commented chirp')
    
            visit '/chirps'
            first('.chirp').click_button 'Comment'
    
            expect(current_path).to eq "/chirps/#{chirp.id}/comments/new"
    
            fill_in 'comment', with: 'This is a next comment on this chirp'
            click_button 'Submit'
    
            expect(current_path).to eq '/chirps'
            expect(first('.chirp')).to have_content 'This is a next comment on this chirp'
        end
    end
end