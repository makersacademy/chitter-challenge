class CreatePeeps < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |peep|
      peep.text     :body
      peep.integer  :likes
      peep.datetime :timestamp
      peep.string   :user_id
    end
  end
end
