class CreatePeeps < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |peep|
      peep.text     :body
      peep.integer  :likes
      peep.string   :user_id
      peep.datetime :created_at
    end
  end
end
