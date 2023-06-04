class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.references :chat, null: false
      t.references :user
      t.text :content, null: false
      t.timestamps
    end
  end
end
