feature 'viewing messages on chitter' do
  scenario 'viewing existing messages on chitter' do
    Message.create(text: "Today is Friday, hooray!")

    visit '/chitter'
    expect(page).to have_content "Today is Friday, hooray!"
  end

  scenario 'viewing messages in chronological order' do
    Message.create(text: "Tomorrow is Saturday")
    Message.create(text: "Yesterday was Thursday but this peep was second")

    visit '/chitter'

    within "div.message:nth-child(1)" do
      expect(page).to have_content "Yesterday was Thursday but this peep was second"
    end

    within "div.message:nth-child(2)" do
      expect(page).to have_content "Tomorrow is Saturday"
    end
  end

  scenario 'viewing messages in chronological order even after update' do
    Message.create(text: "Today is Friday")
    message = Message.create(text: "Tomorrow is Saturday")
    Message.create(text: "Yesterday was Thursday but this peep was most recent")
    Message.update(text: "Tomorrow will be Saturday", id: message.id)

    visit '/chitter'

    within "div.message:nth-child(1)" do
      expect(page).to have_content "Yesterday was Thursday but this peep was most recent"
    end

    within "div.message:nth-child(2)" do
      expect(page).to have_content "Tomorrow will be Saturday"
    end

    within "div.message:nth-child(3)" do
      expect(page).to have_content "Today is Friday"
    end
  end

  scenario 'viewing the timestamp' do
    message = Message.create(text: "Today is Friday")
    display_time = DateTime.parse(message.date).strftime("%A %d/%m/%Y %R")

    visit '/chitter'

    within "div.message:nth-child(1)" do
      expect(page).to have_content "#{display_time}"
      expect(page).to have_content "Today is Friday"
    end
  end
end
