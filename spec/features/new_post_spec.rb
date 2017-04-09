feature 'bottle' do
  scenario 'create new bottle' do

    create_message_bottle
    expect { create_message_bottle }.to change(Bottle, :count).by(1)
    expect(current_path).to eq '/stream'
    expect(page).to have_content 'Will anyone ever read this?'

  end
end
