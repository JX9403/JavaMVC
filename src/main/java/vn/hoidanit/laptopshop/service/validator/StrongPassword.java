package vn.hoidanit.laptopshop.service.validator;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

// Đây là 1 anotation với mục đích validate dữ liệu
@Constraint(validatedBy = StrongPasswordValidator.class)
// Phạm vi hoạt động là 1 trường thông tin hay 1 class
@Target({ ElementType.METHOD, ElementType.FIELD })
// Chạy khi dự án chạy
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface StrongPassword {
    String message() default "Must be 8 characters long and combination of uppercase letters, lowercase letters, numbers, special characters.";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
