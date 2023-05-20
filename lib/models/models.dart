class Hospitals {
  String name;
  String address;
  String biaya;
  String image;
  String info;
  String rating;

  Hospitals({
    required this.name,
    required this.address,
    required this.biaya,
    required this.image,
    required this.info,
    required this.rating,
  });
}

class ScanPromise {
  String name;
  String date;
  String time;
  String status;
  Hospitals hospitals;

  ScanPromise({
    required this.name,
    required this.date,
    required this.time,
    required this.status,
    required this.hospitals,
  });
}

List<Hospitals> hospitals = [
  Hospitals(
    name: "Eka Hospital Bekasi",
    address: "North Bekasi, Bekasi",
    biaya: "Rp 1.630.000,00",
    image: "null",
    info: "24 hours | 0251-8303911 (Emergency Call)",
    rating: "4.5",
  ),
  Hospitals(
    name: "Eka Hospital Cibubur",
    address: "Gn. Putri, Bogor, West Java",
    biaya: "Rp 1.980.000,00",
    image: "null",
    info: "24 hours | 0251-8303911 (Emergency Call)",
    rating: "4.5",
  ),
  Hospitals(
    name: "MRCCC Siloam Hospitals Semanggi",
    address: "South Jakarta, Jakarta Center",
    biaya: "Rp 1.251.000,00",
    image: "null",
    info: "24 hours | 0251-8303911 (Emergency Call)",
    rating: "4.5",
  ),
  Hospitals(
    name: "Siloam hospitals Bogor",
    address:
        "Raya Pajajaran Street, Number 27, Tegallega, Center Bogor, Bogor City, West Java 14140, Indonesia",
    biaya: "Rp 1.251.000,00",
    image: "null",
    info: "24 hours | 0251-8303911 (Emergency Call)",
    rating: "4.5",
  ),
];

List<ScanPromise> promise = [
  ScanPromise(
    name: "Alfian Prisma Yopiangga",
    date: "April 27, 2023",
    time: "06.00",
    status: "Pending",
    hospitals: hospitals[3],
  ),
  ScanPromise(
    name: "M Roy Farchan",
    date: "April 27, 2023",
    time: "06.00",
    status: "Pending",
    hospitals: hospitals[1],
  ),
  ScanPromise(
    name: "Arga Rafi I.M",
    date: "April 27, 2023",
    time: "06.00",
    status: "Pending",
    hospitals: hospitals[2],
  ),
];
