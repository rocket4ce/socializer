class AnadirColumnaAPortafolio < ActiveRecord::Migration
  def change
  	add_column :portafolios, :titulo, :string
  end
end
