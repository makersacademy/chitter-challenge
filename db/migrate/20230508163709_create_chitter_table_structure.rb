class CreateChitterTableStructure < ActiveRecord::Migration[7.0]
  def change    
    create_table :peeps do |t|
      t.string :text
      # below adds two columns that are automatically populated: created_at, updated_at
      t.timestamps
      t.integer :user_id
    end

    create_table :users do |t|
      t.string :password
      t.string :email_address
    end

    add_foreign_key :peeps, :users, name: :fk_user,  on_delete: :cascade

    create_table :tags do |t|
      t.string :content
    end

    def change
      create_join_table(:peeps, :tags)
    end
  end
end
