class Delete < ActiveRecord::Migration[6.0]
  def change
    drop_table :buying_forms
  end
end
