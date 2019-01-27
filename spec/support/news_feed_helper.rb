# This method are used to mock json response given by news_feed controller.
def fetch_user_json(user)
  {"type": "User", "name": user.name}
end

def fetch_comment_json(post)
  post.comments.map do | comment |
    { "type": "Comment", "user": fetch_user_json(comment.user), "content": comment.content }
  end
end

def form_json_response(posts=nil)
  posts ||= Post.order(created_at: :desc)
  posts.map do | post |
    { "type": "Post", "content": post.content, "user": fetch_user_json(post.user), "comments": fetch_comment_json(post)}
  end
end