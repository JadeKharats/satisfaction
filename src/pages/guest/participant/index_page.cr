class Guest::Participant::IndexPage < AuthLayout
  needs participant_id : Int64
  def content
    h1 "Modify this page at #{@participant_id}"
  end
end
