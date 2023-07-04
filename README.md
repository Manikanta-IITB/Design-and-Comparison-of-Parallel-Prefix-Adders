# Design-and-Comparison-of-Parallel-Prefix-Adders
This project shows the design and comparison of various 16-bit parallel prefix adders. The adders designed are
1) Brent Kung Adder
2) Kogge Stone Adder
3) Ladner Fischer Adder
4) Han Carlson Adder
5) Sklansky Adder
# Brent Kung Adder
The sum output is calculated after 8 time units. This adder is not the fastest, yet it has the lowest wiring tracks and fanout, which decreases area and delay respectively.
![WhatsApp Image 2023-07-04 at 11 27 52 AM](https://github.com/Manikanta-IITB/Design-and-Comparison-of-Parallel-Prefix-Adders/assets/138108630/3e5bf217-d369-4da7-a1ce-591b92aa06d3)

# Kogge Stone Adder
The sum output is calculated after 6 time units. This adder is considered as one of the fastest and largest (in the terms of area) adder. However in the last level, it has large amount of wiring tracks which may decrease the speed.
![WhatsApp Image 2023-07-02 at 7 31 33 PM (1)](https://github.com/Manikanta-IITB/Design-and-Comparison-of-Parallel-Prefix-Adders/assets/138108630/c63940f2-f8fb-436e-9099-58f6f6593e28)

# Ladner Fischer Adder
Ladner Fischer Adder is a combination of Kogge Stone and Brent Kung. Similary to Han Carlson, the algorithm is partitioned into the three phases. However, the second phase has Sklansky architecture. The sum output is calculated after 7 time units. Ladner Fischer Adders give us a tradeoff between delay and fanout.
![WhatsApp Image 2023-07-04 at 11 27 52 AM (1)](https://github.com/Manikanta-IITB/Design-and-Comparison-of-Parallel-Prefix-Adders/assets/138108630/b337cdca-9aed-448b-ac90-2138306f1a25)

# Han Carlson Adder
It is a combination of Kogge Stone and Brent Kung. The algorithm is partitioned into the three phases. In the first phase, we create a prefix tree of choosen depth and then we create the inverse tree in the last phase. The second phase has Kogge Stone architecture. The sum output is calculated after 7 time units. Han Carlson Adders gives us a tradeoff between delay and wiring tracks. 
![WhatsApp Image 2023-07-04 at 11 27 51 AM](https://github.com/Manikanta-IITB/Design-and-Comparison-of-Parallel-Prefix-Adders/assets/138108630/4f69a602-dccd-49cb-bdb5-124574b5e230)

# Sklansky Adder
The sum output is calculated after 6 time units. It is similar to KoggeStone yet the difference between them is in the fanout of nodes.
![WhatsApp Image 2023-07-02 at 7 31 33 PM](https://github.com/Manikanta-IITB/Design-and-Comparison-of-Parallel-Prefix-Adders/assets/138108630/df732157-26f6-4aa5-8c90-9139e6be2a46)
