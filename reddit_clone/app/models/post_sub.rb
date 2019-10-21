# == Schema Information
#
# Table name: post_subs
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#  sub_id     :integer          not null
#
# Indexes
#
#  index_post_subs_on_post_id             (post_id)
#  index_post_subs_on_post_id_and_sub_id  (post_id,sub_id) UNIQUE
#  index_post_subs_on_sub_id              (sub_id)
#

class PostSub < ApplicationRecord
	validates :post, :sub, presence: true
	validates :post_id, uniqueness: { scope: :sub_id }

	belongs_to :post

	belongs_to :sub
end
