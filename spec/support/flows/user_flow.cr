class UserFlow < BaseFlow

  def should_be_admin
    el("h3.admin").should be_on_page
  end

  def should_not_be_admin
    el("h3.admin").should_not be_on_page
  end

end
