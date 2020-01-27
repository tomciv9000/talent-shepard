module AppointmentsHelper

  def actor_id_field(appointment)
    if appointment.actor.nil?
      select_tag "appointment[actor_id]", options_from_collection_for_select(Actor.all, :id, :name), selected: @appointment.actor || nil
    else
      select_tag "appointment[actor_id]", appointment.actor_id
    end
  end



  def callback_alert(appointment)
    appointment.callback ? "CALLBACK!" : nil
  end

end
