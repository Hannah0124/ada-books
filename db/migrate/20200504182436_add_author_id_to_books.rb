class AddAuthorIdToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :author, foregin_key: true
  end
end
