Hanami::Model.migration do
  change do
    create_table :blogs do
      primary_key :id
      column      :title,    String, null: false
      column      :content,  String, null: false
    end
  end
end
