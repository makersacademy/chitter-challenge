feature 'Replying to Peeps' do

	scenario '- user can click reply on a peep and post a reply' do
		sign_up(email: 'user2@email.com', username: 'user2name')
		sign_in(email: 'user2@email.com')
		fill_in('content', with: 'User 2 peep')
		click_button('Post')
		click_button('Sign out')
		sign_up
		sign_in
		click_link('Reply')
		fill_in('content', with: 'Reply to user 2 peep')
		click_button('Post')
		expect(Peep.first(content: 'User 2 peep').replies.count).to eq 1
		expect(page).to have_content(/User 2 peep.+Replies.+Reply to user 2 peep/)
		expect(page).to have_content('Reply to user 2 peep', count:1)
	end

end