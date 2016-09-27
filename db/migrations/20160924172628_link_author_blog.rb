Hanami::Model.migration do
  change do
    alter_table :blogs do
      add_foreign_key :author_id, :authors
    end
  end
end
