-- Avrage fare amount w.r.t each Vendor
select VendorID, avg(fare_amount) from `uber_dataset.fact_table` group by VendorID ;


-- Sum of tip amount w.r.t each Payment Mode
select ft.payment_type_id, ptd.payment_type_desc, sum(ft.tip_amount) as sum_tip_amount from `uber_dataset.fact_table` ft 
join  `uber_dataset.payment_type_dim` ptd 
on ft.payment_type_id = ptd.payment_type_id 
group by ft.payment_type_id, ptd.payment_type_desc;


-- Average tip amount w.r.t each Payment Mode
select ft.payment_type_id, ptd.payment_type_desc, avg(ft.tip_amount) as avg_tip_amount from `uber_dataset.fact_table` ft 
join  `uber_dataset.payment_type_dim` ptd 
on ft.payment_type_id = ptd.payment_type_id 
group by ft.payment_type_id, ptd.payment_type_desc;


-- Top 10 pickup locations based on number of trips
select ft.pickup_loc_id, count(ft.trip_id) as trip_count from `uber_dataset.fact_table` ft
join `uber_dataset.pickup_location_dim`  pld
on ft.pickup_loc_id = pld.pickup_loc_id
group by ft.pickup_loc_id
order by trip_count desc;

-- Total number of trips by passenger count
select pcd.passenger_count, count(ft.trip_id) as trip_count from `uber_dataset.fact_table` ft
join `uber_dataset.passenger_count_dim`  pcd
on ft.passenger_count_id = pcd.passenger_count_id
group by pcd.passenger_count
order by trip_count desc;


-- Average fare amount by hour of the day
select dd.pick_hour, avg(ft.fare_amount) as avg_fare_amount from `uber_dataset.fact_table` ft
join `uber_dataset.datetime_dim` dd
on ft.datetime_id = dd.datetime_id
group by dd.pick_hour
order by avg_fare_amount desc;


CREATE OR REPLACE TABLE `uber-data-analytics-392802.uber_dataset.analytics_table` AS 
(
SELECT
ft.VendorID,
dd.tpep_pickup_datetime,
dd.tpep_dropoff_datetime,
pcd.passenger_count,
tdd.trip_distance,
rcd.rate_code_desc,
ptd.payment_type_desc,
pld.pickup_latitude,
pld.pickup_longitude,
dld.dropoff_latitude,
dld.dropoff_longitude,
ft.fare_amount,
ft.extra ,
ft.mta_tax,
ft.tip_amount,
ft.improvement_surcharge,
ft.tolls_amount,
ft.total_amount
from 

`uber_dataset.fact_table` ft

JOIN `uber_dataset.datetime_dim` dd
ON ft.datetime_id = dd.datetime_id

JOIN `uber_dataset.passenger_count_dim` pcd
ON ft.passenger_count_id = pcd.passenger_count_id

JOIN `uber_dataset.trip_distance_dim` tdd 
ON ft.trip_distance_id = tdd.trip_distance_id

JOIN `uber_dataset.rate_code_dim` rcd
ON ft.rate_code_id   = rcd.rate_code_id

JOIN `uber_dataset.payment_type_dim` ptd
ON ft.payment_type_id = ptd.payment_type_id

JOIN `uber_dataset.pickup_location_dim` pld
ON ft.pickup_loc_id = pld.pickup_loc_id

JOIN `uber_dataset.dropoff_location_dim` dld
ON ft.dropoff_loc_id = dld.dropoff_loc_id
);