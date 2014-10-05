module Invitable

  def invited?
   !self.invitation_token.nil?
  end

  def accepted_invitation?
    !self.invitation_token.nil? && !self.invitation_accepted_at.nil?
  end

end
