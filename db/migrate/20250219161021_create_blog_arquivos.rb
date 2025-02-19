class CreateBlogArquivos < ActiveRecord::Migration[8.0]
  def change
    create_table :blog_arquivos do |t|
      t.string :titulo
      t.text :descricao
      t.references :blog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
