module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def pending_requests_count
    current_user.friends_received.pending.count
  end

  def pending_request_sent?(user)
    current_user.pending_requested_friends.include?(user)
  end

  def pending_request_received?(user)
    current_user.pending_received_friends.include?(user)
  end

  def friend_request_confirmed?(user)
    current_user.confirmed_friends.include?(user)
  end
end
