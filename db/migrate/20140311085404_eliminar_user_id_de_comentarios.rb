class EliminarUserIdDeComentarios < ActiveRecord::Migration
  def change
  	remove_column :comentarios, :user_id
  end
end
