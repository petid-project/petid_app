module PetsHelper
	
	def is_lost?(pet_id)
		@lost_report = Pet.find(pet_id).reports.last
		return false if @lost_report == nil || @lost_report.is_active == false
		return true
	end
	
end
