package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoansRejectPojo {

    /*
    {
    "reason":"Bank info is wrong."
   }
     */

    private String reason;
}
