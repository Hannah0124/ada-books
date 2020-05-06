class RemoveAuthorFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :author

    # books know about the author using index as primary key
    add_reference :books, :author, index: true
  end
end
