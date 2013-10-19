class CreateReimbursements < ActiveRecord::Migration
  def change
    create_table :reimbursements do |t|
      t.string :reference
      t.references :payee, index: true
      t.text :comments
      t.text :data

      t.timestamps
    end
  end
end
