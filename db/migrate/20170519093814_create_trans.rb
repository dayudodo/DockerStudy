class CreateTrans < ActiveRecord::Migration[5.1]
  def change
    create_table :trans do |t|
      t.string :english
      t.string :chinese

      t.timestamps
    end
  end
end
