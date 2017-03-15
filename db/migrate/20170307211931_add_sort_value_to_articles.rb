class AddSortValueToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :sort_value, :string
  end
end
