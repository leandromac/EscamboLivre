class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :description, limit: 60 # campo terá máximo de 60 caracteres

      t.timestamps null: false
    end
  end
end
