# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  description  :text             not null
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  moderator_id :integer          not null
#
# Indexes
#
#  index_subs_on_moderator_id  (moderator_id)
#  index_subs_on_title         (title) UNIQUE
#

class Sub < ApplicationRecord
	validates :description, :title, :moderator, presence: true

	belongs_to :moderator,
	class_name: :User

	has_many :posts
end
