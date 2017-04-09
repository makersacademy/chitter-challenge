feature 'bottle' do
  scenario 'create new bottle' do

    create_message_bottle
    expect { create_message_bottle }.to change(Bottle, :count).by(1)
    expect(current_path).to eq '/stream'
    expect(page).to have_content 'Will anyone ever read this?'
  end

    before do
      Timecop.freeze(Time.local(2001, 4, 1, 12, 42))
    end

  scenario 'check message post time is displayed' do

    create_message_bottle
    expect(page).to have_content("12:42")
  end

    after do
      Timecop.return
    end
end
