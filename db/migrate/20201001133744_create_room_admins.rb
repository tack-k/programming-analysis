class CreateRoomAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :room_admins do |t|
      t.references :admin, null: false, foregin_key: true
      t.references :room, null: false, foregin_key: true
      t.timestamps
    end
  end
end
