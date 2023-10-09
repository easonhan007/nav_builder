# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  link_name   :string
#  link_href   :string
#  description :string
#  position    :integer          default(0)
#  section_id  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Item < ApplicationRecord
	belongs_to :section
	validates :link_name, :link_href, presence: true
end
