class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.text :description
      t.string :photo_url

      t.timestamps
    end
  end
end
