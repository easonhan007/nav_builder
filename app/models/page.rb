# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string
#  slug       :string
#  position   :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Page < ApplicationRecord
	has_many :sections

	validates :title, :slug, presence: true
	validates :slug, uniqueness: true

	scope :the_first_one, -> { order('position ASC, created_at DESC').limit(1)}
end

