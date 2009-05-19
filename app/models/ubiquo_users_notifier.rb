class UbiquoUsersNotifier < ActionMailer::Base
  
  #Send a mail to the desired user with a new generated password.
  #It's necesary to specify the host because mailer can't know in what host are running rails
  def forgot_password(user, host)
    subject I18n.t('ubiquo.auth.new_pass_generated', 
      :app_title => Ubiquo::Config.get(:app_title), 
      :locale => user.locale || Ubiquo.default_locale)
    recipients user.email
    from EMAIL_FROM
    body :user => user, :host => host
  end
  
  #Send a mail to the desired user with the information of their new account.
  #It's necesary to specify the host because mailer can't know in what host are running rails
  def confirm_creation(user, welcome_message, host)
    subject I18n.t('ubiquo.auth.new_user_created', 
      :app_title => Ubiquo::Config.get(:app_title), 
      :locale => user.locale || Ubiquo.default_locale)
    recipients user.email
    from EMAIL_FROM
    
    body :user => user, :host => host, :welcome_message => welcome_message
  end

end
