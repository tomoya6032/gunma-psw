class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :article, null: false
      t.text :content, null: false
      t.references :user
      t.timestamps
    end
  end
end
