class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false
      t.references :chat, null: false
      # t.references :information, null: false
      t.timestamps
    end
  end
end
