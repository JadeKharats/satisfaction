class Sessions::Index < BrowserAction
  route do
    html IndexPage, sessions: SessionQuery.new.end_date.desc_order
  end
end
