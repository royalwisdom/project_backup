class AddHeadlineToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :headline, :integer
  end
end
