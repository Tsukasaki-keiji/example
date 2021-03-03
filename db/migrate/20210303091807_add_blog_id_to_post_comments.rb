class AddBlogIdToPostComments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :blog_id, :integer
  end
end
