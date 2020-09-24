class CreateStudies < ActiveRecord::Migration[6.0]
  def change
    create_table :studies do |t|
      t.string :method,  null: false
      t.text :content,   null: false
      t.text :reason,    null: false
      t.string :price,   null: false
      t.timestamps
    end
  end
end
