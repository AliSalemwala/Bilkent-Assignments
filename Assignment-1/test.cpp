#include <iostream>
using namespace std;

#include "HotelReservationSystem.h"

int main() {
    HotelReservationSystem hrs;
    
    // hotel addition, deletion
    
    int roomsH1[4] = {5, 4, 4, 3};
    hrs.addHotel("H1", 4, roomsH1);
    
    int roomsH2[7] = {3, 5, 4, 6, 8, 5, 6};
    hrs.addHotel("H2", 7, roomsH2);
    
    int roomsH3[6] = {2, 3, 2, 5, 3, 3};
    hrs.addHotel("H3", 6, roomsH3);
    
    hrs.showHotels(); // H1, H2, H3
    
    hrs.deleteHotel("H3");
    
    hrs.showHotels(); // H1, H2
    
    hrs.deleteHotel("H4"); // warning: no such hotel
    
    int roomsH4[3] = {3, 2, 5};
    hrs.addHotel("H4", 3, roomsH4);
    hrs.addHotel("H2", 3, roomsH4); // warning: existing hotel with the same name
    
    hrs.showHotels(); // H1, H2, H4
    
    // room reservations
    
    hrs.showRooms("H2"); // ()
    hrs.makeReservation("H2", 2, 2);
    hrs.makeReservation("H2", 3, 5); // warning: no such room
    hrs.makeReservation("H2", 5, 1);
    hrs.makeReservation("H2", 6, 5);
    hrs.makeReservation("H5", 2, 3); // warning: no such hotel
    hrs.makeReservation("H2", 5, 1); // warning: room is already reserved
    
    hrs.showRooms("H2"); // (2,2), (5,1), (6,5)
    
    hrs.cancelReservation("H2", 2, 2);
    hrs.cancelReservation("H4", 4, 4); // warning: no such room
    hrs.makeReservation("H4", 1, 3);
    hrs.cancelReservation("H2", 2, 2); // warning: no such reservation
    hrs.makeReservation("H4", 3, 4);
    hrs.makeReservation("H2", 2, 4);
    
    hrs.showReservations("H2"); // (5,1), (6,5), (2,4)
    hrs.showReservations("H3"); // warning: no such hotel
    hrs.showReservations("H4"); // (1,3), (3,4)
    
    // back to hotel deletion and then some reservations
    
    hrs.deleteHotel("H4");
    
    hrs.makeReservation("H1", 2, 4);
    hrs.makeReservation("H1", 1, 5);
    hrs.cancelReservation("H2", 6, 5);
    
    hrs.showRooms("H1"); // (2,4),(1,5)
    hrs.showRooms("H2"); // (5,1),(2,4)
    
    int roomsH5[10] = {5, 4, 3, 2, 1, 1, 2, 3, 4, 5};
    hrs.addHotel("H5", 10, roomsH5);
    
    hrs.showHotels(); // H1, H2, H5
    
    return 0;
}