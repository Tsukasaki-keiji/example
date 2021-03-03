class RemoveCommentsFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :comments, :text
  end
end
