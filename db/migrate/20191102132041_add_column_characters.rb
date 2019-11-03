class AddColumnCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :job_id, :integer
    add_column :characters, :char_name, :string
    add_column :characters, :hp, :integer
    add_column :characters, :power, :integer
    add_column :characters, :generic1, :integer
    add_column :characters, :generic2, :integer

  end
end
