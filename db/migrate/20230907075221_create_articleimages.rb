class CreateArticleimages < ActiveRecord::Migration[6.0]
  def change
    create_table :articleimages do |t|

      t.timestamps
    end
  end
end
