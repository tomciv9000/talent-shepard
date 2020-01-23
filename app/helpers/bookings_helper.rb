module BookingsHelper

    def accepted_status(booking)
      booking.accepted ? "YES" : "NO"
    end

    def contract_status(booking)
        booking.contract_signed ? "YES" : "NO"
    end

    


end
