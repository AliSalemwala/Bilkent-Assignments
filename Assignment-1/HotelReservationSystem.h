class HotelReservationSystem {
    public:
    HotelReservationSystem();
    ~HotelReservationSystem();

    void addHotel( const string name, const int numFloors, const int *numRooms );
    void deleteHotel( const string name );
    void makeReservation( const string name, const int floor, const int room );
    void cancelReservation( const string name, const int floor, const int room );

    void showHotels();
    void showRooms( const string name );
    void showReservations( const string name );
};