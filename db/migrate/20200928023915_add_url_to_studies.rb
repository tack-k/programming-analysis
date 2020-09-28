class AddUrlToStudies < ActiveRecord::Migration[6.0]
  def change
    add_column :studies, :url, :text
  end
end
