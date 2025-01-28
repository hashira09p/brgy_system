class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :firstname
      t.string :requested_document
      t.string :document_purpose
      t.string :state
      t.string :message
      t.timestamps
    end
  end
end
