require 'Hirb'

# List all Users, Comments, Posts, Categories or Tags.
Hirb.enable

def hirb_puts( table )
  puts Hirb::Helpers::AutoTable.render table
end

puts "Users are:"
hirb_puts User.all

puts "Comments are:"
hirb_puts Comment.all

puts "Posts are:"
hirb_puts Post.all

puts "Categories are:"
hirb_puts Category.all

puts "Tags are:"
hirb_puts Tag.all

# List a given user's comments
puts "First Users comments are:"
user = User.first
hirb_puts user.comments

puts "Set a comment to belong to a different user"
puts "Before:"
hirb_puts Comment.first.author
puts "After:"
hirb_puts Comment.first.author = User.last

puts "Set a post to be in a different category"
hirb_puts Post.first.category = Category.first

puts "Set a collection of comments to replace a user's current comments"
hirb_puts User.first.comments = [Comment.first, Comment.second]

puts "Return a given comment's author"
hirb_puts Comment.last.author

puts  "List a given post's comments"
hirb_puts Post.first.comments

puts "Return a given comment's parent post"
hirb_puts Comment.first.post

puts "Remove one post from a category's collection of posts"
puts "before"
hirb_puts pts = Category.first.posts
puts "deletion"
hirb_puts pts.delete(pts.last)
puts "after"
hirb_puts pts.posts

puts "List the posts authored by a given user"
hirb_puts User.first.posts

# (hint: there's an association method for this)
puts "List the IDs of all posts authored by a given user "
hirb_puts User.first.posts.ids

puts "Set a collection of Posts to replace that user's currently authored posts"
hirb_puts User.first.posts = [Post.first, Post.second]

puts "List the authors of a given post"
hirb_puts Post.first.authors

puts "Set a collection of Users to replace a given Post's authors in a similar way"
puts "Before"
hirb_puts Post.first.authors
puts "After"
hirb_puts Post.first.authors = [User.first, User.second]

puts "Accomplish the same thing by only using IDs (hint: there's an association method for this...)"
hirb_puts Post.first.post_user_ids = 4

puts "List the posts under a given tag"
hirb_puts Posts.first.tags

puts "Add a new post to a given tag by only using its ID"
hirb_puts Tag.last.posts = [Post.first, Post.second]

puts "Add a new tag to a given post by only using its ID"
hirb_puts Tag.last.post_ids << 6

puts "List the tags on a given post"
hirb_puts Post.first.tags
