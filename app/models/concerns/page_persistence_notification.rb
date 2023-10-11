module PagePersistenceNotification
	extend ActiveSupport::Concern
	
	def notify_to_persist
		page.update_attribute(:need_persistence, true)
	end

end