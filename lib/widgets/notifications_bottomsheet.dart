import 'package:flutter/material.dart';

class NotificationsBottomSheet extends StatefulWidget {
  @override
  _NotificationsBottomSheetState createState() => _NotificationsBottomSheetState();
}

class _NotificationsBottomSheetState extends State<NotificationsBottomSheet> {
  List<String> categories = ["All", "Unread", "Read"];
  int selectedCategoryIndex = 0;

  List<Map<String, dynamic>> allNotifications = [
    {"title": "Delayed Order",
      "message": '"We’re sorry! Your order is running late. New ETA: 10:30 PM. Thanks for your patience!"',
       "status": "unread",
      "time": "9:42 AM"},
    {"title": "Promotional Offer:",
      "message": '"Craving something delicious? 🍔 Get 20% off on your next order. Use code: YUMMY20."',
       "status": "unread",
      "time": "Last Wednesday at 9:42 AM"},
    {"title": "Out for Delivery:" ,
        "message": '"Your order is on the way! 🚗 Estimated arrival: 15 mins. Stay hungry!"',
       "status": "read",
      "time": "Last Wednesday at 9:42 AM"},
    {"title": "Order Confirmation",
      "message": '"Your order has been placed! 🍔 We\'re preparing it now. Track your order live!"',
       "status": "unread",
      "time": "Last Wednesday at 2:40 AM"},
    {"title": "Delivered:",
      "message": '"Enjoy your meal! 🍕 Your order has been delivered. Rate your experience!"',
       "status": "read",
      "time": "Last Wednesday at 8:32 AM"},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredNotifications = allNotifications.where((notification) {
      if (selectedCategoryIndex == 0) return true; // All
      if (selectedCategoryIndex == 1) return notification["status"] == "unread"; // Unread
      if (selectedCategoryIndex == 2) return notification["status"] == "read"; // Read
      return false;
    }).toList();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back),
                Text("Notifications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(Icons.more_vert),
              ],
            ),
          ),
          SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(categories.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: selectedCategoryIndex == index ? Colors.green : Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }),
          ),

          Divider(),
          Expanded(
            child: Container(
              color: Color(0xFFF1F6FC),
              child: filteredNotifications.isNotEmpty
                  ? ListView.separated(
                shrinkWrap: true,
                itemCount: filteredNotifications.length,
                itemBuilder: (context, index) {
                  var notification = filteredNotifications[index];
                  return notificationItem(notification["title"], notification["message"], notification["time"]);
                },
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[200],
                  thickness: 0.8,
                  indent: 0,
                  endIndent: 0,
                ),
              )
                  : Center(
                child: Text(
                  "No notifications",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget notificationItem(String? title, String? message, String? time) {
    return
     ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title ?? "No Title", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(message ?? "No message available",style: TextStyle(fontSize: 14)),
            Text(time ?? "Unknown Time", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),

    );
  }
}

void showNotificationsSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height / 1.4,
        child: NotificationsBottomSheet(),
      );
    },
    backgroundColor: Colors.transparent,
    isDismissible: true,
  );
}
