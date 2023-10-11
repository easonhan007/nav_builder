# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  title      :string
#  position   :integer          default(0)
#  page_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Section < ApplicationRecord
	include PagePersistenceNotification

  belongs_to :page
  has_many :items

  validates :title, presence: true

	after_commit :notify_to_persist

  def with_page  
    "#{page.title} : #{title}"
  end
end
