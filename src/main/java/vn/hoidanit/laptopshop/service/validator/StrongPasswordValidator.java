package vn.hoidanit.laptopshop.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

// Đây là 1 annotation với phạm vi là dugnf lên field - ghi đè anotation
public class StrongPasswordValidator implements ConstraintValidator<StrongPassword, String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        // check if string contains at least one digit, one lowercase letter, one
        // uppercase letter, one special character and 8 characters long
        return value.matches("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!*()]).{6,}$");
    }
}