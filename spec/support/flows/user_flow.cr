class UserFlow < BaseFlow

  def should_be_admin
    el("@Admin-flag").should be_on_page
  end

  def should_not_be_admin
    el("@Admin-flag").should_not be_on_page
  end

end
