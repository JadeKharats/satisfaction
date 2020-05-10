class Sessions::Index < BrowserAction
  route do
    html IndexPage, sessions: SessionQuery.new.preload_participants.end_date.desc_order
  end
end
