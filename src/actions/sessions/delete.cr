class Sessions::Delete < BrowserAction
  route do
    SessionQuery.find(session_id).delete
    flash.success = "Deleted the record"
    redirect Index
  end
end
