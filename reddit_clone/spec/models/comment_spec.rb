# == Schema Information
#
# Table name: comments
#
#  id                :bigint           not null, primary key
#  content           :text             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  author_id         :integer          not null
#  parent_comment_id :integer
#  post_id           :integer          not null
#
# Indexes
#
#  index_comments_on_author_id          (author_id)
#  index_comments_on_parent_comment_id  (parent_comment_id)
#  index_comments_on_post_id            (post_id)
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
