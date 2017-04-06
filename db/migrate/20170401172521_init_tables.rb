class InitTables < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :address
      t.text :description
      t.integer :property_type
      t.string :landlord
      t.text :architect_info
      t.text :general_contractor_info
      t.boolean :allow_drawings
      t.boolean :allow_photos
    end

    create_table :project_users do |t|
      t.integer :user_id, index: true
      t.integer :project_id, index: true
      t.integer :role
      t.integer :trade_id
    end

    create_table :trades do |t|
      t.integer :project_id, index: true
      t.string :name
    end

    create_table :events do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.integer :priority
      t.integer :project_id
      t.boolean :email_notification
    end

    create_table :date_change_requests do |t|
      t.integer :project_id, index: true
      t.integer :event_id, index: true
      t.string :reason
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :approved # null = pending
      t.text :trades_affected 
    end


    create_table :change_order_requests do |t|
      t.integer :project_id, index: true
      t.text :description
      t.boolean :approved
      t.integer :trade_id, index: true
      t.boolean :backcharge_to_trade
      t.boolean :contract
      t.decimal :contract_amount
      t.string :contract_document
      t.boolean :time_and_material
    end

    create_table :notes do |t|
      t.integer :project_id, index: true
      t.text :content
      t.integer :user_id, index: true
    end

    create_table :photos do |t|
      t.integer :user_id, index: true
      t.string :image
      t.integer :project_id, index: true
    end

    create_table :comments do |t|
      t.integer :parent_id
      t.string :parent_type
      t.text :content
      t.integer :user_id, index: true

      t.index [:parent_type, :parent_id]
    end

    create_table :drawings do |t|
      t.integer :user_id, index: true
      t.string :name
      t.string :file
      t.integer :project_id, index: true
    end

    # create_table :FillableDocument do |t|

    create_table :documents do |t|
      t.integer :project_id, index: true
      t.integer :user_id, index: true
      t.string :image
      t.integer :folder_id
    end

    create_table :folders do |t|
      t.integer :project_id, index: true
      t.string :name
    end

    create_table :notifications do |t|
      t.integer :project_id, index: true
      t.integer :parent_id
      t.string :parent_type 

      t.index [:parent_type, :parent_id]
    end
  end
end