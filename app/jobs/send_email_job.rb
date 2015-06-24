class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(report)
    @report = report
    MyMailer.send_found_pet_message(@report).deliver_now
  end
end
