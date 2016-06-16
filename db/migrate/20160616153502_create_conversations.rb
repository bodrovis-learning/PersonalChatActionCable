class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.references :author, foreign_key: true
      t.references :receiver, foreign_key: true

      t.timestamps
    end
  end
end
