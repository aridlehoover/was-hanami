Hanami::Model.migration do
  change do
    create_table :recipients do
      primary_key :id

      column :channel, String, null: false
      column :address, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index [:channel, :address], unique: true
    end
  end
end
