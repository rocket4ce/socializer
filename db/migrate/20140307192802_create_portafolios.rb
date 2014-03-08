class CreatePortafolios < ActiveRecord::Migration
  def change
    create_table :portafolios do |t|
      t.text :descripcion
      t.integer :user_id

      t.timestamps
    end
  end
end
