class RemovePostCommentsFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :post_comments, :text
  end
end
