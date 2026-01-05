C:\Program Files\Redis

redis-cli 

keys *   // lấy toàn bộ các key 

keys ad*   // lấy các key bắt đầu bằng ad 

keys ad   // lấy các key có ad trong chuỗi dbsize

DEL user   // xoá key

SELECT index  

Establish a connection to a Redis server using the IP address ‘127.0.0.1’ and the default port ‘6379’ with the following command:
redis-cli -h 127.0.0.1 -p 6379
