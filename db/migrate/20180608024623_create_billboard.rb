class CreateBillboard < ActiveRecord::Migration[5.0]
  def change
    create_table :billboards do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.string :source

      t.timestamps
    end
  end
end
