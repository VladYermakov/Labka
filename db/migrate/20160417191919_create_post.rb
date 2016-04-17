class CreatePost < ActiveRecord::Migration
  def self.up
    create_table :posts do |post|
      post.string   :title
      post.text     :content
      post.timestamps
    end
    Post.create(title: "Example Post",
                content: "Content of my first post")
    Post.create(title: "Second Post",
                content: "Content of my second post")
  end
  def self.down
    drop_table :posts
  end
end
