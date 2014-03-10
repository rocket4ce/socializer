class CreatePerfiles < ActiveRecord::Migration
  def change
    create_table :perfiles do |t|
      t.integer :user_id
      t.string :tabajo
      t.string :ciudad
      t.text :descripcion
      t.string :telefono
      t.string :celular
      t.string :face
      t.string :tw
      t.string :g
      t.string :you
      t.string :pin
      t.string :link
      t.string :flr

      t.timestamps
    end
  end
end
