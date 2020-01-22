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

    def appointment_time(appointment)
      appointment.time.strftime("%b %e, %l:%M %p - %A")
    end



end
# This might be useful later on when I have enums for certain values
#     f.select :projtype_type, options_for_select([['Service Request', 1], ['Log Entry', 2]], selected: @project.projtype || nil),
#         include_blank: true, class:'form-control m-b'