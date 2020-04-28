package com.bookstore.service;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.controller.frontend.shoppingcart.ShoppingCart;
import com.bookstore.dao.OrderDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

public class OrderServices {
	private OrderDAO orderDao;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
		
	
	public OrderServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.orderDao = new OrderDAO();
	}



	public void ListAllOrder() throws ServletException, IOException {
		List<BookOrder> listOrder = orderDao.listAll();
		
		request.setAttribute("listOrder", listOrder);
		
		String listPage = "order_list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(listPage);
		dispatcher.forward(request, response);
		
		
	}



	public void viewOrderdetailsAdmin() throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("id"));
		
		BookOrder order = orderDao.get(orderId);
		request.setAttribute("order", order);
		
		String detailPage = "order_detail.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
		dispatcher.forward(request, response);
		
	}



	public void showCheckoutForm() throws ServletException, IOException {
		String detailPage = "frontend/checkout.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
		dispatcher.forward(request, response);
		
	}



	public void placeOrder() throws ServletException, IOException {
		String recipientName = request.getParameter("recipientName");
		String recipientPhone = request.getParameter("recipientPhone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String zipcode = request.getParameter("zipcode");
		String paymentMethod = request.getParameter("paymentMethod");
		String shippingAddress = address + ", " + city + ", " + country + ", " + zipcode;
		
		BookOrder order = new BookOrder();
		order.setRecipientName(recipientName);
		order.setRecipientPhone(recipientPhone);
		order.setShippingAddress(shippingAddress);
		order.setPaymentMethod(paymentMethod);
	
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		order.setCustomer(customer);
		
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
		Map<Book, Integer> items = shoppingCart.getItems();
		
		Iterator<Book> iterator = items.keySet().iterator();
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		
		while(iterator.hasNext()) {
			Book book = iterator.next();
			Integer quantity = items.get(book);
			float subtotal = quantity * book.getPrice();
			
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBook(book);
			orderDetail.setBookOrder(order);
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);
		}
		
		order.setOrderDetails(orderDetails);
		order.setOrderTotal(shoppingCart.getTotalAmount());
		
		orderDao.create(order);
		
		shoppingCart.clear();
		
		String message = "Thank You. Your order has been received."
					+ " You should receive your order shortly.";
		request.setAttribute("message", message);
		
		String messagePage = "frontend/message.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(messagePage);
		dispatcher.forward(request, response);
	}

}
