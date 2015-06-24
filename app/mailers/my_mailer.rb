class MyMailer < Devise::Mailer

  def confirmation_instructions(record, token, opts={})
    # code to be added here later
  end

  def reset_password_instructions(record, token, opts={})
    options = {
      :subject => "Password Reset",
      :email => record.email,
      :name => record.name,
      :global_merge_vars => [
        {
          name: "password_reset_link",
          content: ENV['HOST'] + "/users/password/edit?reset_password_token=#{token}"
        }
      ],
      :template => "Forgot Password"
    }
    mandrill_send options
  end

  def unlock_instructions(record, token, opts={})
    # code to be added here later
  end

  def send_found_pet_message(report)
    options = {
      :subject => "Message from PetID",
      :email => report.user.email,
      :name => report.user.name,
      :global_merge_vars => [
        {
          name: "report_link",
          content: ENV['HOST'] + "/reports/#{report.id}"
        }
      ],
      :template => "PetID Message"
    }
    mandrill_send options
  end

  def mandrill_send(opts={})
    message = {
      :subject=> "#{opts[:subject]}",
      :from_name=> "PetID",
      :from_email=>"noreply@petid.herokuapp.com",
      :to=> [{"name"=>"#{opts[:name]}", "email"=>"#{opts[:email]}", "type"=>"to"}],
      :global_merge_vars => opts[:global_merge_vars]
    }
    sending = MANDRILL.messages.send_template opts[:template], [], message
    rescue Mandrill::Error => e
      Rails.logger.debug("#{e.class}: #{e.message}")
      raise
  end

end
