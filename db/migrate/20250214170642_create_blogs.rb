class CreateBlogs < ActiveRecord::Migration[8.0]
  def change
    create_table :blogs do |t|
      t.string :titulo
      t.text :descricao

      t.timestamps
    end
  end
end
