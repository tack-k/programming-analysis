class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :message, null: false
      t.references :admin, foregin_key: true
      t.references :user, foregin_key: true
      t.references :room, null: false, foregin_key: true
      t.timestamps
    end
  end
end
