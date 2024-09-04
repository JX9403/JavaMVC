package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class DashboardController {

    private UserService userService;

    public DashboardController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("cntUsers", this.userService.cntUsers());
        model.addAttribute("cntProducts", this.userService.cntProducts());
        model.addAttribute("cntOrders", this.userService.cntOrders());
        return "admin/dashboard/show";
    }
}
