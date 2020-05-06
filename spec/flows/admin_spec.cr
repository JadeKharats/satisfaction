require "../spec_helper"

describe "Admin flow" do
  it "don't show admin header to simple user" do
    user = UserBox.create
    flow = UserFlow.new

    flow.visit Me::Show, as: user
    flow.should_not_be_admin
  end

  it "show admin header to admin user" do
    user = UserBox.create &.email("admin@quiz.com")
    flow = UserFlow.new

    flow.visit Me::Show, as: user
    flow.should_be_admin
  end
end

private def should_be_signed_in(flow)
  flow.el("@sign-out-button").should be_on_page
end
