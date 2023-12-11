package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoanplansAddPOJO {

    /*
    {
            "category_id": 1,
            "name": "Car Loan 9 ",
            "title": "Car Loan 9",
            "total_installment": 20,
            "installment_interval": 20,
            "per_installment": "4.00",
            "minimum_amount": "2000.00000000",
            "maximum_amount": "5000.00000000",
            "delay_value": 25,
            "fixed_charge": "100.00000000",
            "percent_charge": "1.00000000",
            "is_featured": 0,
            "application_fixed_charge": "20.00000000",
            "application_percent_charge": "3.00000000",
            "instruction": "Car Loan Plan 9"
    }
     */
    private int category_id;
    private String name;
    private String title;
    private int total_installment;
    private int installment_interval;
    private String per_installment;
    private String minimum_amount;
    private String maximum_amount;
    private int delay_value;
    private String fixed_charge;
    private String percent_charge;
    private int is_featured;
    private String application_fixed_charge;
    private String application_percent_charge;
    private String instruction;

}


