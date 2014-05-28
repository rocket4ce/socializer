class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.integer :portafolio_id
      t.string :imagen

      t.timestamps
    end
  end
end
