Hanami::Model.migration do
  change do
    create_table :alerts do
      primary_key :id

      column :uuid, String, null: false
      column :title, String, null: false
      column :location, String, null: false
      column :message, :text
      column :publish_at, DateTime, null: false
      column :effective_at, DateTime
      column :expires_at, DateTime

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index :uuid, unique: true
    end
  end
end
