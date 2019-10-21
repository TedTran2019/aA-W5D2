# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string           not null
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#

class Post < ApplicationRecord
	validates :title, :author, presence: true
	validates :subs, presence: true

	belongs_to :author,
	class_name: :User

	has_many :post_subs,
	dependent: :destroy,
	inverse_of: :post

	has_many :subs,
	through: :post_subs,
	source: :sub
end
