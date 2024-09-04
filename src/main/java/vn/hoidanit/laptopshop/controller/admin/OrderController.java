package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.core.Ordered;
import org.springframework.security.web.util.matcher.OrRequestMatcher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.OrderService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getDashboard(Model model) {
        List<Order> orders = this.orderService.fetchOrders();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/detail/{id}")
    public String getOrderDetailPage(Model model, @PathVariable long id) {
        Order order = this.orderService.fetchOrderById(id).get();
        List<OrderDetail> orderDetails = order.getOrderDetails();
        model.addAttribute("orderDetails", orderDetails);
        model.addAttribute("order", order);
        model.addAttribute("id", id);

        return "admin/order/detail";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(@PathVariable long id, Model model) {
        Order order = this.orderService.fetchOrderById(id).get();
        model.addAttribute("id", id);
        model.addAttribute("order", order);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String postUpdateOrder(Model model, @ModelAttribute("order") Order order) {
        Order currentOrder = this.orderService.fetchOrderById(order.getId()).get();

        if (currentOrder != null) {
            currentOrder.setStatus(order.getStatus());
            this.orderService.handleSaveOrder(currentOrder);
        }

        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrderPage(@PathVariable long id, Model model) {
        model.addAttribute("id", id);

        model.addAttribute("newOrder", new Order());
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String postDeleteOrder(@ModelAttribute("newOrder") Order order) {

        this.orderService.deleteOrder(order.getId());

        return "redirect:/admin/order";
    }

}
