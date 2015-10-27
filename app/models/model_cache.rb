class ModelCache

  def initialize(discussions: {}, motions: {}, comments: {})
    @discussion_results, @motion_results, @comment_results = discussions, motions, comments
  end

  def discussions
    @discussions ||= Discussion.where id: @discussion_results.map { |d| d['id'] }
  end

  def motions
    @motions ||= Motion.where id: @motion_results.map { |m| m['id'] }
  end

  def comments
    @comments ||= Comment.where id: @comment_results.map { |c| c['id'] }
  end

  def discussion_for(discussion_id)
    discussions.select { |d| d.id == discussion_id.to_i }.first
  end

  def motion_for(discussion_id)
    motions.select { |m| m.discussion_id == discusison_id.to_i }.first
  end

  def comment_for(discussion_id)
    comments.select { |c| c.discussion_id == discussion_id.to_i }.first
  end

  def discussion_blurb_for(discussion_id)
    (@discussion_results.select { |d| d['id'] == discussion_id }.first || {})['blurb']
  end

  def motion_blurb_for(discussion_id)
    (@motion_results.select { |m| m['discussion_id'] == discussion_id }.first || {})['blurb']
  end

  def comment_blurb_for(discussion_id)
    (@comment_results.select { |c| c['discussion_id'] == discussion_id }.first || {})['blurb']
  end
end
