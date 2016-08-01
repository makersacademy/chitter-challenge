feature 'replying to peeps' do
  scenario 'add a reply to a peep' do
    sign_up
    post_a_comment(comment: 'first comment')
    visit '/peeps'

    fill_in 'content', with: 'test'
    click_button('Reply')

    expect(current_path).to eq '/peeps'
    peep = Peep.first
    expect(peep.replys.map(&:content)).to(include('test'))
  end
end
