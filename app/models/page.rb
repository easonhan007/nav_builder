# == Schema Information
#
# Table name: pages
#
#  id               :integer          not null, primary key
#  title            :string
#  slug             :string
#  position         :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  need_persistence :boolean          default(TRUE)
#
class Page < ApplicationRecord
	has_many :sections

	validates :title, :slug, presence: true
	validates :slug, uniqueness: true

	scope :the_first_one, -> { order('position ASC, created_at DESC').limit(1)}
	# only allow display 10 items in the nav part
	scope :for_nav, -> { order('position ASC, created_at DESC').limit(10)}

	def html_path
		File.join(Rails.root, 'storage', "#{title.parameterize}.html")
	end

	def notify_all_pages_to_update_nav
		Page.for_nav.each do |page|
			page.update_attribute(:need_persistence, true)
		end
	end

end

