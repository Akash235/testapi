class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.string :invoiceNumber
      t.float :invoiceAmount

      t.timestamps
    end
  end
end
