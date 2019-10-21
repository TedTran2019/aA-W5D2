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

class Comment < ApplicationRecord
	validates :author, :post, :content, presence: true

	belongs_to :author,
	class_name: :User

	belongs_to :post

	belongs_to :parent_comment,
	foreign_key: :parent_comment_id,
	class_name: :Comment,
	optional: true

	has_many :child_comments,
	foreign_key: :parent_comment_id,
	class_name: :Comment
end
