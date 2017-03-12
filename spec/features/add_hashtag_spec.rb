# feature 'Adding hashtags' do
#   scenario 'I can add a hashtag to my peeps' do
#
#     visit '/peeps/add'
#     fill_in 'peep_content', with: 'Something different for now'
#     fill_in 'hashtags', with: 'random'
#     click_button 'Add peep'
#
#     peep = Peep.first
#     expect(peep.hashtags.map(&:name)).to include('random')
#     expect(current_path).to eq '/peeps'
#
#   end
#
#   scenario 'I can add multiple hashtags to my peeps' do
#
#     visit '/peeps/add'
#     fill_in 'peep_content', with: 'Christmas pudding in summer?'
#     fill_in 'hashtags', with: 'food seasonal'
#     click_button 'Add peep'
#
#     peep = Peep.first
#     expect(peep.hashtags.map(&:name)).to include('food', 'seasonal')
#     expect(current_path).to eq '/peeps'
#
#   end
#
# end
