package spring.mvc.controller;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.entity.Tran;

import java.sql.Time;

import spring.mvc.model.entity.Ticket;
import spring.mvc.bean.TrainTime;
import spring.mvc.model.dao.ScheduleDao;
import spring.mvc.model.dao.TicketDao;
import spring.mvc.model.entity.Schedule;

@Controller
@RequestMapping("/ticket")
public class BookingController {

	SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd");
	
	@Autowired
	private TicketDao ticketDao;

	@Autowired
	private ScheduleDao scheduleDao;

	Logger logger = LoggerFactory.getLogger(getClass());

	// 前往首頁
	@GetMapping("/frontend/main")
	public String main(HttpSession session) {
		return "/frontend/main";
	}
	// 車票
	// 訂/修/刪除(需要API)--------------------------------------------------------------------

	// 訂票頁面
	@GetMapping("/booking")
	public String bookPage(HttpSession session) {
		return "/frontend/booking/booking";
	}

	/**
	 * /TrainTicketBooking/mvc/ticket/book
	 * 
	 * @param bookList
	 * @param session
	 * @return
	 * @throws ParseException 
	 */
	

	// 選擇乘車時間
	@PostMapping("/booking_schedule")
	public String booking(
			@RequestParam("departStation") String departStation,
			@RequestParam("arriveStation") String arriveStation, 
			@RequestParam("departDate") String departDate,
			@RequestParam("departTime") String departTime, 
			Model model) throws Exception {

		List<Schedule> schedule = scheduleDao.findSchedulesByStationAndTime(departStation, arriveStation, departTime);
		model.addAttribute("schedule", schedule);
		model.addAttribute("departDate", departDate);
		return "/frontend/booking/booking_schedule";

	}
	
	@PostMapping("/booking")
	public String book(
			@RequestParam("book") Integer[] bookList,
			@RequestParam("departDate") String departDate,
			HttpSession session) throws ParseException {
		
		List<Ticket> tmpTickets = new ArrayList<>();
		if(bookList!=null) {
			for(Integer tranNo: bookList) {
				Ticket tmpTicket = new Ticket();
				tmpTicket.setTrainNo(String.valueOf(tranNo));
				tmpTicket.setDate(sfd.parse(departDate));
				tmpTickets.add(tmpTicket);
			}
		}
		
		session.setAttribute("tmpTickets", tmpTickets);
		return "/frontend/booking/booking_confirm";
	}
	
	

	// 取票人資訊

	@PostMapping("/booking_confirm")
	public String bookingConfirm(@RequestParam("userId") String userId, HttpSession session, Model model) {

		List<Ticket> tmpTickets = (List<Ticket>) session.getAttribute("tmpTickets");

		for (Ticket ticket : tmpTickets) {
			ticket.setUserId(userId);
			ticket.setSeatId(new Random().nextInt(30));
			ticket.setPrice(100);
			Random random = new Random();
			int randomInt = random.nextInt(26);  // 生成介於 0（包括）到 26（不包括）的隨機整數
			char randomChar = (char) ('A' + randomInt);  // 將隨機整數轉換為對應的大寫字母
			String trainCarId = String.valueOf(randomChar);
			ticket.setTrainCarId(trainCarId);			
			ticketDao.addTicket(ticket);
			
		}
		model.addAttribute("ticket", tmpTickets);
		return "frontend/booking/booking";
	}

	// 訂票結果

	// 查詢訂票首頁
	@GetMapping("/ticket_query")
	public String ticketQuery() {
		return "frontend/ticket_query/ticket_query";
	}

	// 根據 userId 及 ticketId 查詢訂票
	@GetMapping("/ticket_query_present")
	public String ticketQueryResult(@RequestParam("ticketId") Integer ticketId, @RequestParam("userId") String userId,
			Model model) {
		// Optional : 使用.get()取得參數
		Ticket ticket = ticketDao.findTicketByTicketIdAndUserId(ticketId, userId).get();
		model.addAttribute("ticket", ticket);

		return "frontend/ticket_query/ticket_query_present";
	}

	// 取消訂票
	@GetMapping("/ticket_query/cancel")
	public String cancelticketByTicketId(@RequestParam("ticketId") Integer ticketId, HttpSession session) {
		ticketDao.cancelTicketByTicketId(ticketId);
		logger.info("取消訂票");
		return "redirect:/mvc/ticket/frontend/main";
	}

//Schedule------------------------------------------------------------------------------------------------------		

	// 搜尋時刻表頁面(前端)
	@GetMapping("/schedule_query")
	public String timeTable() {

		return "frontend/schedule_query/schedule_query";
	}

	// 列車時刻查詢(前端)
	@PostMapping("/schedule_query_present")
	public String scheduleQuery(@RequestParam("departStation") String departStation,
			@RequestParam("arriveStation") String arriveStation, Model model) throws Exception {

		if (departStation.equals(arriveStation)) {

			model.addAttribute("checkingMessage", "起點終點重複");
			System.out.println("起點終點重複");
			return "frontend/schedule_query/schedule_query";
		}

		List<Schedule> schedule = scheduleDao.findSchedulesByStation(departStation, arriveStation);
		model.addAttribute("schedule", schedule);
		return "frontend/schedule_query/schedule_query_present";
	}

	

	 //找出所有時刻表(後端)
	 @GetMapping("/backend/traintable_display")
	 public String findAllSchedules(HttpSession session, Model model) {
	 List<Schedule> schedule = scheduleDao.findAllSchedules();
	 model.addAttribute("schedule", schedule);
	 return "/backend/traintable_display/traintable_display";
	 }
	 
	 //新增時刻表(form)
	 
	 //修改時刻表(form)
	 
	 //刪除時刻表
	 
	 //列出所有車票
	@GetMapping("/backend/ticket_info_display")
	public String ticketinfo(HttpSession session,Model model) {
		List<Ticket> tickets = ticketDao.findAllTickets();
		 model.addAttribute("tickets", tickets);
		return "/backend/ticket_info/ticket_info_display";

	}

}
