module PostsHelper
  def last_comment_info(post)
    " (#{time_ago_in_words(post.comments.last.created_at)} #{t(:ago)})" if post.comments.size > 0
  end

  def votes_up_info(post)
    "#{t(:vote_up)} - #{post.votes_for.up.count}".html_safe
  end

  def votes_down_info(post)
    "#{t(:vote_down)} - #{post.votes_for.down.count}".html_safe
  end

  def timestamp_display(time)
    time.strftime('%y %b %d - %H:%M') if time
  end
end
