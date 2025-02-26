class AddPerfilFirstToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :nome, :string
    add_column :users, :apelido, :string
    add_column :users, :numerodetelefone, :integer, null: true
    add_column :users, :fotodeperfio, :string
  end
end
