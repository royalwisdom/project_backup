class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.text :content
      t.integer :tag
      
      t.timestamps
    end
  end
end
