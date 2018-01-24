class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants, :id => false do |t|
      t.integer    :id
      t.text       :name

      t.timestamps null: false
    end
  end
end
