describe Reply do
  scenario 'can add a reply to a peep' do
    Reply.create(text: 'here is a reply', date_time: DateTime.now, peep_id: 1, user_id: 1)
    expect(Peep.first.replies.first.text).to eq 'here is a reply'
  end
end
