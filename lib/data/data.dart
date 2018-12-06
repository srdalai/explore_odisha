class PlaceData {
  String image, title, description;

  PlaceData(this.image, this.title, this.description);
}

List<PlaceData> places = [
  PlaceData("assets/places/BPIA.jpg", "Bhubaneswar", "description"),
  PlaceData("assets/places/Lingaraj-Temple.jpg", "Lingaraj Temple", "Lingaraja Temple is a Hindu temple dedicated to Shiva and is one of the oldest temples in Bhubaneswar, the capital of the East Indian state of Odisha."),
  PlaceData("assets/places/Udayagiri-and-Khandagiri-Caves.jpg", "Udayagiri and Khandagiri Caves", "Udayagiri and Khandagiri Caves, formerly called Katak Caves or Cuttack caves, are partly natural and partly artificial caves of archaeological, historical and religious importance near the city of Bhubaneswar in Odisha, India."),
  PlaceData("assets/places/Nandankanan-Zoological-Park.jpg", "Nandankanan Zoological Park", "Nandankanan Zoological Park is a 400-hectare zoo and botanical garden in Bhubaneswar, Odisha, India. Established in 1960, it was opened to the public in 1979 and became the first zoo in India to join World Association of Zoos and Aquariums in 2009."),
  PlaceData("assets/places/Dhauli.jpg", "Dhauli", "Dhauli hillsare located on the banks of the river Daya, 8 km south of Bhubaneswar in Odisha. It is a hill with vast open space adjoining it, and has major Edicts of Ashoka engraved on a mass of rock, by the side of the road leading to the summit of the hill."),
  PlaceData("assets/places/Rajarani-Temple.jpg", "Rajarani Temple", "Rajarani Temple is an 11th-century Hindu temple located in Bhubaneswar, the capital city of Odisha, India. The temple is believed to have been known originally as Indreswara."),
  PlaceData("assets/places/Parashurameshvara-Temple.jpg", "Parashurameshvara Temple", "Parashurameshvara Temple also spelt Parsurameswar, located in the East Indian city of Bhubaneswar, the capital of Odisha, is considered the best preserved specimen of an early Orissan Hindu temple dated to the Shailodbhava period between the 7th and 8th centuries CE."),
  PlaceData("assets/places/Odisha-State-Museum.jpg", "Odisha State Museum", "Odisha State Museum is a museum in Bhubaneswar, Odisha. In its original form it was established in 1932 and later moved to the current building in 1960."),
  PlaceData("assets/places/Dhabaleswar.jpg", "Dhabaleswar", "Dhabaleswar Temple is dedicated to the worship of Lord Shiva. It is situated at a distance of 27 km from the city of Cuttack, in the exotic island of Lord Dhabaleshwar. It is one of the famous weekend tours from Cuttack."),
  PlaceData("assets/places/Museum-of-Tribal-Arts-and-Artefacts.jpg", "Museum of Tribal Arts and Artefacts", "The Museum of Tribal Arts and Artifacts, popularly known as Tribal Museum, also conceptually labeled as Museum of Man, is a museum in Bhubaneshwar, Odisha, India. It was established in the year 1953."),
  PlaceData("assets/places/Ananta-Vasudeva-Temple.jpg", "Ananta Vasudeva Temple", "Ananta Vasudeva Temple is a Hindu temple dedicated to Lord Krishna, an avatar of Lord Vishnu located in Bhubaneswar, the state capital of Odisha, India."),
];

class Data {
  var openWeatherAPIKEY = "a2cf88f959335cc6ddbce46a08700d6b";
  var url = "http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=a2cf88f959335cc6ddbce46a08700d6b";
} 