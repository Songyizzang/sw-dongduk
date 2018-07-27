class CreateApplies < ActiveRecord::Migration[5.2]
  def change
    create_table :applies do |t|

      t.boolean :matching
      t.references :post
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
