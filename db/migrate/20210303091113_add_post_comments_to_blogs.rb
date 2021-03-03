class AddPostCommentsToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :post_comments, :text
  end
end
