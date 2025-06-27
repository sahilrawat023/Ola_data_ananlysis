create database ola;
use ola;
# for all succesfull bookings
create view successfull_booking as
select * from bookings 
where Booking_Status="Success";
select * from successfull_booking;

## averge ride distance for each veichle 

create view avg_dis_for_each_veichle as
select Vehicle_Type,avg(Ride_Distance) as average_dis
from bookings 
group by Vehicle_Type;

## Get the total number of cancelled rides by customers:
create view cancel_rides_by_customer as
select count(*) as Total_cancel_rides from bookings
where Booking_Status="Canceled by Customer";

#List the top 5 customers who booked the highest number of rides:

select Customer_ID,count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by count(Booking_ID) desc limit 5;

# Get the number of rides cancelled by drivers due to personal and car-related issues:

select Canceled_Rides_by_Driver,count(*) as cancled_by_rider 
from bookings
where Booking_Status='Canceled by Driver' and
Canceled_Rides_by_Driver='Personal & Car related issue'
group by Canceled_Rides_by_Driver;


## Find the maximum and minimum driver ratings for Prime Sedan bookings:

select min(Driver_Ratings) as minimum ,max(Driver_Ratings) as maximum
from bookings
where Vehicle_Type='Prime Sedan';

## Retrieve all rides where payment was made using UPI:
select * from bookings 
where Payment_Method='UPI';


## Find the average customer rating per vehicle type:

select Vehicle_Type,avg(Driver_Ratings) as average
from bookings
group by Vehicle_Type;


## Calculate the total booking value of rides completed successfully:

select sum(Booking_Value) as sum_of_rides
from bookings
where Booking_Status='Success';


##  List all incomplete rides along with the reason:

SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';




