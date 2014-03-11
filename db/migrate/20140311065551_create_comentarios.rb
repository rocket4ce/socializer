class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.integer :portafolio_id
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
